import 'package:deep_read_app/domain/datasources/local_storage_datasource.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isBookFavorite(String bookId) {
    return datasource.isBookFavorite(bookId);
  }

  @override
  Future<List<Book>> loadBooks({int limit = 10, offset = 0}) {
    return datasource.loadBooks(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite(Book book) {
    return datasource.toggleFavorite(book);
  }
}
