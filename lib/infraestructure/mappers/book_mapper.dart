import 'dart:convert';

import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/book_details.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/books_google_response.dart';

class BookMaper {
  static Book googleBookToEntity(BookGoogleModel googleBook) => Book(
        id: googleBook.id,
        selfLink: googleBook.selfLink,
        title: googleBook.volumeInfo.title,
        subtitle: googleBook.volumeInfo.subtitle,
        authors: googleBook.volumeInfo.authors ?? [],
        publisher: googleBook.volumeInfo.publisher ?? 'Desconocido',
        publishedDate: googleBook.volumeInfo.publishedDate ?? 'Desconocido',
        description: googleBook.volumeInfo.description ?? 'Sin descripción',
        printType: googleBook.volumeInfo.printType ?? '',
        categories: googleBook.volumeInfo.categories,
        averageRating: googleBook.volumeInfo.averageRating,
        ratingsCount: googleBook.volumeInfo.ratingsCount,
        imageLinksJson: jsonEncode(googleBook.volumeInfo.imageLinks?.toJson()),
        language: googleBook.volumeInfo.language,
        previewLink: googleBook.volumeInfo.previewLink!,
      );

  static Book bookDetailsToEntity(BookDetails googleBook) => Book(
        id: googleBook.id,
        selfLink: googleBook.selfLink,
        title: googleBook.volumeInfo.title ?? 'Sin titulo',
        subtitle: 'Sin subtitulo',
        authors: googleBook.volumeInfo.authors ?? [],
        publisher: googleBook.volumeInfo.publisher ?? 'Desconocido',
        publishedDate: googleBook.volumeInfo.publishedDate ?? 'Desconocido',
        description: googleBook.volumeInfo.description ?? 'Sin descripción',
        printType: googleBook.volumeInfo.printType ?? '',
        categories: googleBook.volumeInfo.categories ?? [],
        averageRating: 0.0,
        ratingsCount: 0,
        imageLinksJson: jsonEncode(googleBook.volumeInfo.imageLinks?.toJson()),
        language: googleBook.volumeInfo.language,
        previewLink: googleBook.volumeInfo.previewLink!,
      );
}
