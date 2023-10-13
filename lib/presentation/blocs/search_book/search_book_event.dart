part of 'search_book_bloc.dart';

abstract class SearchBookEvent {}

class SearchQueryUpdated extends SearchBookEvent {
  final String query;

  SearchQueryUpdated({required this.query});
}
