import 'dart:convert';

import 'package:deep_read_app/domain/entities/image_links.dart';

import 'package:isar/isar.dart';

part 'book.g.dart';

@collection
class Book {
  Id? isarId;

  final String id;
  final String title;
  final String selfLink;
  final String? subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final String printType;
  final List<String> categories;
  final double? averageRating;
  final int? ratingsCount;
  // final ImageLinks imageLinks;
  final String language;
  final String imageLinksJson;
  final String previewLink;
  @ignore
  ImageLinks? get imageLinks {
    if (imageLinksJson.isEmpty) {
      return null;
    }

    if (!imageLinksJson.trim().startsWith('{') ||
        !imageLinksJson.trim().endsWith('}')) {
      return null;
    }

    return ImageLinks.fromJson(jsonDecode(imageLinksJson));
  }

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
    required this.imageLinksJson,
    required this.language,
    required this.previewLink,
  });
}
