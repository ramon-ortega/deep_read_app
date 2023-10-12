import 'package:deep_read_app/domain/entities/book.dart';

abstract class BooksDataSource {
  Future<List<Book>> getScience({int page = 0});
  Future<List<Book>> getPolitics({int page = 0});
  Future<List<Book>> getHorror({int page = 0});
  Future<Book> getMovieById(String id);
}
