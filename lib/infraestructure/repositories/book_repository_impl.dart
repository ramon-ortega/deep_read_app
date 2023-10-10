import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/domain/repositories/books_repository.dart';
import 'package:deep_read_app/infraestructure/datasources/book_google_api_datasource.dart';

class BookRepositoryImpl extends BooksRepository {
  final BookGoogleAPIDatasource booksRepository = BookGoogleAPIDatasource();

  @override
  Future<List<Book>> getScience({int page = 1}) {
    return booksRepository.getScience(page: page);
  }

  @override
  Future<List<Book>> getPoliticis({int page = 0}) {
    return booksRepository.getPolitics(page: page);
  }

  @override
  Future<List<Book>> getHorror({int page = 0}) {
    return booksRepository.getHorror(page: page);
  }
}
