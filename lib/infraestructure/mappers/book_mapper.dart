import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/domain/entities/image_links.dart';
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
        imageLinks: googleBook.volumeInfo.imageLinks ??
            ImageLinks(
                smallThumbnail:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                thumbnail:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                small:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                medium:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                large:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg',
                extraLarge:
                    'https://t3.ftcdn.net/jpg/03/34/83/22/360_F_334832255_IMxvzYRygjd20VlSaIAFZrQWjozQH6BQ.jpg'),
        language: googleBook.volumeInfo.language,
      );

  static Book bookDetailsToEntity(BookDetails googleBook) => Book(
        id: googleBook.id,
        selfLink: googleBook.selfLink,
        title: googleBook.volumeInfo.title,
        subtitle: 'Sin subtitulo',
        authors: googleBook.volumeInfo.authors,
        publisher: googleBook.volumeInfo.publisher,
        publishedDate: googleBook.volumeInfo.publishedDate,
        description: googleBook.volumeInfo.description,
        printType: googleBook.volumeInfo.printType,
        categories: googleBook.volumeInfo.categories ?? [],
        averageRating: 0.0,
        ratingsCount: 0,
        imageLinks: googleBook.volumeInfo.imageLinks,
        language: googleBook.volumeInfo.language,
      );
}
