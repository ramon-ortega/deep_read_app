import 'package:deep_read_app/domain/entities/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getScience({int page = 0});
  Future<List<Book>> getPoliticis({int page = 0});
  Future<List<Book>> getHorror({int page = 0});
}
