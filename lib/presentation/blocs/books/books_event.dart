part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class LoadBooksEvent extends BooksEvent {
  final int page;

  LoadBooksEvent({required this.page});
}
