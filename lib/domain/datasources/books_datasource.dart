import 'package:deep_read_app/domain/entities/book.dart';

abstract class BooksDataSource {
  Future<List<Book>> getPage({int page = 1});
}
