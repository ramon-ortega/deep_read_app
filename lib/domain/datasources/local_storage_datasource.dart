import 'package:deep_read_app/domain/entities/book.dart';

abstract class LocalStorageDatasource {
  Future<void> toggleFavorite(Book book);
  Future<bool> isBookFavorite(String bookId);

  Future<List<Book>> loadBooks({int limit = 30, offset = 0});
}
