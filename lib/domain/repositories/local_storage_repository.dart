import 'package:deep_read_app/domain/entities/book.dart';

abstract class LocalStorageRepository {
  Future<void> toggleFavorite(Book book);
  Future<bool> isBookFavorite(String bookId);

  Future<List<Book>> loadBooks({int limit = 10, offset = 0});
}
