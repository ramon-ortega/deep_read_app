part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class LoadBooksEvent extends BooksEvent {
  final int? page;

  LoadBooksEvent({this.page});
}

class LoadPoliticsBooksEvent extends BooksEvent {
  final int? page;

  LoadPoliticsBooksEvent({this.page});
}

class LoadDetailsBookEvent extends BooksEvent {
  final String bookId;

  LoadDetailsBookEvent({required this.bookId});
}
