import 'package:deep_read_app/domain/entities/book.dart';
import 'package:deep_read_app/infraestructure/models/booksgoogle/books_google_response.dart';

class BookMaper {
  static Book googleBookToEntity(BookGoogleModel googleBook) => Book(
        id: googleBook.id,
        selfLink: googleBook.selfLink,
        title: googleBook.volumeInfo.title,
        subtitle: googleBook.volumeInfo.subtitle,
        authors: googleBook.volumeInfo.authors,
        publisher: googleBook.volumeInfo.publisher ?? 'Desconocido',
        publishedDate: googleBook.volumeInfo.publishedDate,
        description: googleBook.volumeInfo.description ?? 'Sin descripción',
        printType: googleBook.volumeInfo.printType,
        categories: googleBook.volumeInfo.categories,
        averageRating: googleBook.volumeInfo.averageRating,
        ratingsCount: googleBook.volumeInfo.ratingsCount,
        imageLinks: googleBook.volumeInfo.imageLinks,
        language: googleBook.volumeInfo.language,
      );
}
