part of 'books_bloc.dart';

abstract class BooksState {
  final List<Book>? scienceBooks;
  final List<Book>? headerBooks;
  final List<Book>? politicsBooks;
  final List<Book>? horrorBooks;
  final Map<String, Book>? cacheBooks;
  const BooksState({
    this.scienceBooks,
    this.headerBooks,
    this.politicsBooks,
    this.horrorBooks,
    this.cacheBooks,
  });
}

final class BooksInitial extends BooksState {
  const BooksInitial();
}

final class BooksLoading extends BooksState {
  const BooksLoading();
}

final class BooksLoaded extends BooksState {
  final List<Book> scienceBooks;
  final List<Book> headerBooks;
  final List<Book> politicsBooks;
  final List<Book> horrorBooks;
  final Map<String, Book>? cacheBooks;

  const BooksLoaded({
    required this.scienceBooks,
    required this.headerBooks,
    required this.politicsBooks,
    required this.horrorBooks,
    required this.cacheBooks,
  }) : super(
          headerBooks: headerBooks,
          scienceBooks: scienceBooks,
          politicsBooks: politicsBooks,
          horrorBooks: horrorBooks,
          cacheBooks: cacheBooks,
        );
}

final class ErrorBooks extends BooksState {
  final String error;

  const ErrorBooks({required this.error});
}
