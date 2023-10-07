class Book {
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
  final List<String> authors;
  final int firstPublishYear;
  final String ia;
  final bool publicScan;
  final bool hasFulltext;
  final String availability;

  Book({
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
}
