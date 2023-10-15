import 'package:animate_do/animate_do.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksHorizontalListView extends StatefulWidget {
  final List<Book> books;
  final String? title;
  final VoidCallback? loadNextPage;

  const BooksHorizontalListView({
    super.key,
    required this.books,
    this.title,
    this.loadNextPage,
  });

  @override
  State<BooksHorizontalListView> createState() =>
      _BooksHorizontalListViewState();
}

class _BooksHorizontalListViewState extends State<BooksHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 306,
      child: Column(
        children: [
          if (widget.title != null)
            _Title(
              title: widget.title,
            ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return FadeInRight(
                  child: _Slide(
                    book: widget.books[index],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Book book;
  const _Slide({required this.book});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                book.imageLinks?.thumbnail ??
                    'https://www.colombianosune.com/sites/default/files/asociaciones/NO_disponible-43_15.jpg',
                width: 120,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingPress) {
                  if (loadingPress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<BooksBloc>()
                          .add(LoadDetailsBookEvent(bookId: book.id));
                      context.push('/home/0/book/${book.id}');
                    },
                    child: child,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 120,
            child: Text(
              book.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star_half_outlined,
                color: Colors.yellow.shade800,
              ),
              const SizedBox(
                width: 3,
              ),
              Text(
                '${book.averageRating ?? 'No value'}',
                style: textStyles.bodyMedium?.copyWith(
                  color: Colors.yellow.shade800,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          const Icon(
            Icons.chevron_right,
            size: 26,
          )
        ],
      ),
    );
  }
}
