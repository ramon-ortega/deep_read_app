import 'dart:math';
// import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/repositories/book_repository_impl.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final _booksRepo = BookRepositoryImpl();
  int _startPage = 0;
  final int _startPoliticsPage = 0;
  List<Book> _currentBooks = [];
  final List<Book> _politicsBooks = [];
  final List<Book> _horrorMovies = [];
  bool isLoading = false;

  BooksBloc() : super(const BooksInitial()) {
    on<LoadBooksEvent>(_loadBooks);
    add(LoadBooksEvent(page: _startPage));
    on<LoadPoliticsBooksEvent>(
        (event, emit) => _loadPoliticsBooks(event, emit, state));
    add(LoadPoliticsBooksEvent(page: _startPoliticsPage));
  }

  Future<void> _loadBooks(
      LoadBooksEvent event, Emitter<BooksState> emit) async {
    try {
      if (isLoading) return;

      isLoading = true;

      final List<Book> newBooks = await _booksRepo.getScience(page: _startPage);
      _currentBooks = [..._currentBooks, ...newBooks];
      final int endIndex = min(8, newBooks.length);
      final List<Book> limitedBooks = _currentBooks.sublist(0, endIndex);

      emit(BooksLoaded(
        scienceBooks: _currentBooks,
        headerBooks: limitedBooks,
        politicsBooks: state.politicsBooks ?? _politicsBooks,
        horrorBooks: state.horrorBooks ?? _horrorMovies,
      ));
      _startPage++;
      isLoading = false;
    } catch (e) {
      // log("Error loading books: $e");
      emit(ErrorBooks(error: e.toString()));
    }
  }

  Future<void> _loadPoliticsBooks(LoadPoliticsBooksEvent event,
      Emitter<BooksState> emit, BooksState state) async {
    try {
      final List<Book> newBooks =
          await _booksRepo.getPoliticis(page: _startPoliticsPage);
      final List<Book> horrorBooks =
          await _booksRepo.getHorror(page: _startPoliticsPage);

      final List<Book> limitedBooks = _currentBooks.sublist(0, 8);

      emit(BooksLoaded(
        scienceBooks: _currentBooks,
        headerBooks: limitedBooks,
        politicsBooks: newBooks,
        horrorBooks: horrorBooks,
      ));
    } catch (e) {
      // log("Error loading books: $e");
      emit(ErrorBooks(error: e.toString()));
    }
  }
}
