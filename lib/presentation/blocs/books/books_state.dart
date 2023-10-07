part of 'books_bloc.dart';

@immutable
abstract class BooksState {
  const BooksState();
}

final class BooksInitial extends BooksState {
  const BooksInitial();
}

final class BooksLoading extends BooksState {
  const BooksLoading();
}

final class BooksLoaded extends BooksState {
  final List<Book> books;

  const BooksLoaded({required this.books});
}

final class ErrorBooks extends BooksState {
  final String error;

  const ErrorBooks({required this.error});
}
