import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/domain/repositories/books_repository.dart';
import 'package:deep_read_app/infraestructure/datasources/book_google_api_datasource.dart';

class BookRepositoryImpl extends BooksRepository {
  final BookGoogleAPIDatasource booksRepository = BookGoogleAPIDatasource();

  @override
  Future<List<Book>> getPage({int page = 1}) {
    return booksRepository.getPage(page: page);
  }
}
