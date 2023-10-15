import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:flutter/material.dart';

typedef SearchBookCallback = Future<List<Book>> Function(String query);

class SearchBookDelegate extends SearchDelegate<Book?> {
  final SearchBookCallback searchBooks;
  StreamController<List<Book>> debounceBooks = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchBookDelegate({required this.searchBooks});

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        if (query.isEmpty) {
          debounceBooks.add([]);
          return;
        }
        final books = await searchBooks(query);
        debounceBooks.add(books);
        isLoadingStream.add(false);
      },
    );
  }

  void clearStreams() {
    debounceBooks.close();
    isLoadingStream.close();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              infinite: true,
              spins: 10,
              animate: query.isNotEmpty,
              child: IconButton(
                onPressed: () => query = '',
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
              ),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(
                Icons.clear,
              ),
            ),
          );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_outlined),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _onQueryChanged(query);
    return StreamBuilder(
      stream: debounceBooks.stream,
      builder: (context, snapshot) {
        final books = snapshot.data ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            final Book book = books[index];
            return _BookItem(
              book: book,
              onBookSelected: (context, book) {
                clearStreams();
                close(context, book);
              },
            );
          },
          itemCount: books.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return StreamBuilder(
      stream: debounceBooks.stream,
      initialData: const [],
      builder: (context, snapshot) {
        final books = snapshot.data ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            final Book book = books[index];
            return _BookItem(
              book: book,
              onBookSelected: (context, book) {
                clearStreams();
                close(context, book);
              },
            );
          },
          itemCount: books.length,
        );
      },
    );
  }

  @override
  String? get searchFieldLabel => 'Buscar libro';
}

class _BookItem extends StatelessWidget {
  final Book book;
  final Function onBookSelected;

  const _BookItem({
    required this.book,
    required this.onBookSelected,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onBookSelected(context, book);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.imageLinks?.thumbnail ??
                      'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: textStyles.titleMedium,
                  ),
                  Text('by ${book.authors.join(', ')}')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
