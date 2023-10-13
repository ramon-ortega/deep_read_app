import 'package:deep_read_app/config/constants/environment.dart';
import 'package:deep_read_app/domain/datasources/books_datasource.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/mappers/book_mapper.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/book_details.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/books_google_response.dart';
import 'package:dio/dio.dart';

class BookGoogleAPIDatasource extends BooksDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1',
      queryParameters: {
        'api_key': Environment.apiKey,
      }));

  @override
  Future<List<Book>> getScience({int page = 0}) async {
    final response = await dio.get(
        '/volumes?q=subject:science_fiction&maxResults=10',
        queryParameters: {
          'startIndex': page * 10,
        });

    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Book>> getPolitics({int page = 0}) async {
    final response = await dio
        .get('/volumes?q=subject:politics&maxResults=10', queryParameters: {
      'startIndex': page * 10,
    });
    return _jsonToBooks(response.data);
  }

  @override
  Future<List<Book>> getHorror({int page = 0}) async {
    final response = await dio
        .get('/volumes?q=subject:horror&maxResults=10', queryParameters: {
      'startIndex': page * 10,
    });
    return _jsonToBooks(response.data);
  }

  List<Book> _jsonToBooks(Map<String, dynamic> json) {
    final bookGoogleResponse = BooksGoogleResponse.fromJson(json);
    final List<Book> books = bookGoogleResponse.items
        .map((bookGoogle) => BookMaper.googleBookToEntity(bookGoogle))
        .toList();

    return books;
  }

  @override
  Future<Book> getBookById(String id) async {
    final response = await dio.get(
      '/volumes/$id',
    );
    if (response.statusCode != 200) {
      throw Exception('Book with id $id not found');
    }

    final bookGoogle = BookDetails.fromJson(response.data);
    final Book book = BookMaper.bookDetailsToEntity(bookGoogle);

    return book;
  }

  @override
  Future<List<Book>> searchBooks(String query) async {
    if (query == '') return [];
    final response = await dio.get('/volumes', queryParameters: {
      'q': query,
    });
    return _jsonToBooks(response.data);
  }
}
