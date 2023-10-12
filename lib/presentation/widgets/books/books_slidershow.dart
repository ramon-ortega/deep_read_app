import 'package:card_swiper/card_swiper.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/presentation/blocs/books/books_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksSlideshow extends StatelessWidget {
  final List<Book> books;

  const BooksSlideshow({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 240,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.4,
        scale: 0.6,
        autoplay: true,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return _Slide(
            book: book,
          );
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Book book;
  const _Slide({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black45,
          blurRadius: 10,
          offset: Offset(0, 10),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            book.imageLinks.thumbnail!,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black12),
                );
              }
              return GestureDetector(
                onTap: () {
                  context
                      .read<BooksBloc>()
                      .add(LoadDetailsBookEvent(bookId: book.id));
                  context.push('/book/${book.id}');
                },
                child: FadeIn(
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
