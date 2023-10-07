import 'package:deep_read_app/infraestructure/models/booksgoogle/books_google_response.dart';
import 'package:dio/dio.dart';
import 'package:deep_read_app/domain/datasources/books_datasource.dart';

// class OpenLibraryDatasource extends BooksDataSource {
//   final dio = Dio(
//     BaseOptions(baseUrl: 'https://openlibrary.org'),
//   );

//   @override
//   Future<List<BookGoogleModel>> getPage({int page = 1}) async {
//     final List<BookGoogleModel> books = [];
//     final response = await dio.get('/business.json');

//     return books;
//   }
// }
