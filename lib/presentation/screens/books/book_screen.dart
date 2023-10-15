import 'dart:developer';

import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/datasources/isar_datasource.dart';
import 'package:deep_read_app/infraestructure/repositories/local_storage_repository_impl.dart';
import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:deep_read_app/presentation/blocs/local_storage/local_storage_bloc.dart';
import 'package:deep_read_app/presentation/widgets/books/book_item_read_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatelessWidget {
  static const name = 'book-screen';

  final String bookId;

  const BookScreen({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        final Book? book = state.cacheBooks?[bookId];
        if (state.cacheBooks?[bookId] == null) {
          context.read<BooksBloc>().add(LoadDetailsBookEvent(
                bookId: bookId,
              ));
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                _CustomSliverAppBar(
                  book: book!,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _BookDetails(book: book),
                    childCount: 1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BookDetails extends StatelessWidget {
  final Book book;
  const _BookDetails({required this.book});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          book.title,
          style: textStyles.titleLarge,
        ),
        Text(
          'by ${book.authors.join(', ')}',
          style: textStyles.titleMedium,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Descripción',
          style: textStyles.titleSmall,
        ),
        SizedBox(
          width: size.width * 0.4,
          child: const Divider(
            color: Colors.black87,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  book.imageLinks?.thumbnail ??
                      'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_15.jpg',
                  width: size.width * 0.3,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: (size.width - 40) * 0.7,
                child: Text(book.description),
              )
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Categorias',
          style: textStyles.titleSmall,
        ),
        SizedBox(
          width: size.width * 0.4,
          child: const Divider(
            color: Colors.black87,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ...book.categories.map(
                (categorie) => Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: Chip(
                    label: Text(categorie),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Vista Previa',
          style: textStyles.titleSmall,
        ),
        SizedBox(
          width: size.width * 0.4,
          child: const Divider(
            color: Colors.black87,
          ),
        ),
        BookItemReadButton(
          previewLink: book.previewLink,
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatefulWidget {
  final Book book;

  const _CustomSliverAppBar({
    required this.book,
  });

  @override
  State<_CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<_CustomSliverAppBar> {
  bool? isFavoriteBook;

  void _loadFavoriteStatus() async {
    isFavoriteBook = await LocalStorageRepositoryImpl(
      IsarDatasource(),
    ).isBookFavorite(widget.book.id);
    log("IS FAVORITE FROM SERVER $isFavoriteBook");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            context
                .read<LocalStorageBloc>()
                .add(ToggleFavoriteEvent(widget.book));
            _loadFavoriteStatus();
          },
          icon: FutureBuilder<bool>(
            future: LocalStorageRepositoryImpl(
              IsarDatasource(),
            ).isBookFavorite(widget.book.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Icon(Icons.favorite_border);
              } else if (snapshot.hasData && snapshot.data == true) {
                return const Icon(Icons.favorite, color: Colors.red);
              } else {
                return const Icon(Icons.favorite_border);
              }
            },
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          widget.book.title,
          style: const TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                widget.book.imageLinks?.medium ??
                    widget.book.imageLinks?.extraLarge ??
                    widget.book.imageLinks?.thumbnail ??
                    'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_15.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black45,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.black45,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.2],
                    colors: [
                      Colors.black45,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
