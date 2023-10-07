import 'package:deep_read_app/domain/entities/image_links.dart';

class Book {
  final String id;
  final String title;
  final String selfLink;
  final String? subtitle;
  final List authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final String printType;
  final List categories;
  final double? averageRating;
  final int? ratingsCount;
  final ImageLinks imageLinks;
  final String language;

  Book({
    required this.id,
    required this.title,
    required this.selfLink,
    required this.subtitle,
    required this.authors,
    required this.publisher,
    required this.publishedDate,
    required this.description,
    required this.printType,
    required this.categories,
    required this.averageRating,
    required this.ratingsCount,
    required this.imageLinks,
    required this.language,
  });
}
