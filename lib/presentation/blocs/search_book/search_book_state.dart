part of 'search_book_bloc.dart';

abstract class SearchBookState {}

class SearchBlocInitial extends SearchBookState {}

class SearchResultState extends SearchBookState {
  final List<Book>? resultsBook;

  SearchResultState({required this.resultsBook});
}
