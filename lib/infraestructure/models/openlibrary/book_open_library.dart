import 'package:deep_read_app/infraestructure/models/openlibrary/author_open_library.dart';
import 'package:deep_read_app/infraestructure/models/openlibrary/availability_open_library.dart';

class BookOpenLibrary {
  final String key;
  final String title;
  final int editionCount;
  final int coverId;
  final String coverEditionKey;
  final List<String> subject;
  final List<String> iaCollection;
  final bool lendinglibrary;
  final bool printdisabled;
  final String lendingEdition;
  final String lendingIdentifier;
  final List<AuthorOpenLibrary> authors;
  final int firstPublishYear;
  final String ia;
  final bool publicScan;
  final bool hasFulltext;
  final AvailabilityOpenLibrary availability;

  BookOpenLibrary({
    required this.key,
    required this.title,
    required this.editionCount,
    required this.coverId,
    required this.coverEditionKey,
    required this.subject,
    required this.iaCollection,
    required this.lendinglibrary,
    required this.printdisabled,
    required this.lendingEdition,
    required this.lendingIdentifier,
    required this.authors,
    required this.firstPublishYear,
    required this.ia,
    required this.publicScan,
    required this.hasFulltext,
    required this.availability,
  });

  factory BookOpenLibrary.fromJson(Map<String, dynamic> json) =>
      BookOpenLibrary(
        key: json["key"],
        title: json["title"],
        editionCount: json["edition_count"],
        coverId: json["cover_id"],
        coverEditionKey: json["cover_edition_key"],
        subject: List<String>.from(json["subject"].map((x) => x)),
        iaCollection: List<String>.from(json["ia_collection"].map((x) => x)),
        lendinglibrary: json["lendinglibrary"],
        printdisabled: json["printdisabled"],
        lendingEdition: json["lending_edition"],
        lendingIdentifier: json["lending_identifier"],
        authors: List<AuthorOpenLibrary>.from(
            json["authors"].map((x) => AuthorOpenLibrary.fromJson(x))),
        firstPublishYear: json["first_publish_year"],
        ia: json["ia"],
        publicScan: json["public_scan"],
        hasFulltext: json["has_fulltext"],
        availability: AvailabilityOpenLibrary.fromJson(json["availability"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "edition_count": editionCount,
        "cover_id": coverId,
        "cover_edition_key": coverEditionKey,
        "subject": List<dynamic>.from(subject.map((x) => x)),
        "ia_collection": List<dynamic>.from(iaCollection.map((x) => x)),
        "lendinglibrary": lendinglibrary,
        "printdisabled": printdisabled,
        "lending_edition": lendingEdition,
        "lending_identifier": lendingIdentifier,
        "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
        "first_publish_year": firstPublishYear,
        "ia": ia,
        "public_scan": publicScan,
        "has_fulltext": hasFulltext,
        "availability": availability.toJson(),
      };
}
