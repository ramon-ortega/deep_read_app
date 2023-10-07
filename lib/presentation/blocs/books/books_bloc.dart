import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/repositories/book_repository_impl.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final _booksRepo = BookRepositoryImpl();
  int startPage = 0;

  BooksBloc() : super(const BooksInitial()) {
    on<LoadBooksEvent>((event, emit) async {
      // try {
      final List<Book> books = await _booksRepo.getPage(page: event.page);
      log("MOVIUES $books");
      emit(BooksLoaded(books: books));
      // } catch (e) {
      // log("E $e");
      // emit(ErrorBooks(error: e.toString()));
      // }
    });
    add(LoadBooksEvent(page: startPage));
  }
}
