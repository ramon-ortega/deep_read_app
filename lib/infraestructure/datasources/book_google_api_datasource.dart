import 'dart:developer';

import 'package:deep_read_app/config/constants/environment.dart';
import 'package:deep_read_app/domain/datasources/books_datasource.dart';
import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/mappers/book_mapper.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/books_google_response.dart';
import 'package:dio/dio.dart';

class BookGoogleAPIDatasource extends BooksDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://www.googleapis.com/books/v1',
      queryParameters: {
        'api_key': Environment.apiKey,
      }));

  @override
  Future<List<Book>> getPage({int page = 1}) async {
    final response =
        await dio.get('/volumes?q=subject:science_fiction&maxResults=20');
    log("REPOMSE ${response.data}");
    final bookGoogleResponse = BooksGoogleResponse.fromJson(response.data);
    final List<Book> books = bookGoogleResponse.items
        .map((bookGoogle) => BookMaper.googleBookToEntity(bookGoogle))
        .toList();

    return books;
  }
}
