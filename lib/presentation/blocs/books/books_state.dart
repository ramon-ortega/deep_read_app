part of 'books_bloc.dart';

@immutable
abstract class BooksState {
  final List<Book>? scienceBooks;
  final List<Book>? headerBooks;
  final List<Book>? politicsBooks;
  final List<Book>? horrorBooks;
  const BooksState({
    this.scienceBooks,
    this.headerBooks,
    this.politicsBooks,
    this.horrorBooks,
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

  const BooksLoaded({
    required this.scienceBooks,
    required this.headerBooks,
    required this.politicsBooks,
    required this.horrorBooks,
  }) : super(
          headerBooks: headerBooks,
          scienceBooks: scienceBooks,
          politicsBooks: politicsBooks,
          horrorBooks: horrorBooks,
        );
}

final class ErrorBooks extends BooksState {
  final String error;

  const ErrorBooks({required this.error});
}
