class AvailabilityOpenLibrary {
  final String status;
  final bool availableToBrowse;
  final bool availableToBorrow;
  final bool availableToWaitlist;
  final bool isPrintdisabled;
  final bool isReadable;
  final bool isLendable;
  final bool isPreviewable;
  final String identifier;
  final String? isbn;
  final dynamic oclc;
  final String openlibraryWork;
  final String openlibraryEdition;
  final DateTime? lastLoanDate;
  final String? numWaitlist;
  final DateTime? lastWaitlistDate;
  final bool isRestricted;
  final bool isBrowseable;
  final String src;

  AvailabilityOpenLibrary({
    required this.status,
    required this.availableToBrowse,
    required this.availableToBorrow,
    required this.availableToWaitlist,
    required this.isPrintdisabled,
    required this.isReadable,
    required this.isLendable,
    required this.isPreviewable,
    required this.identifier,
    required this.isbn,
    required this.oclc,
    required this.openlibraryWork,
    required this.openlibraryEdition,
    required this.lastLoanDate,
    required this.numWaitlist,
    required this.lastWaitlistDate,
    required this.isRestricted,
    required this.isBrowseable,
    required this.src,
  });

  factory AvailabilityOpenLibrary.fromJson(Map<String, dynamic> json) =>
      AvailabilityOpenLibrary(
        status: json["status"],
        availableToBrowse: json["available_to_browse"],
        availableToBorrow: json["available_to_borrow"],
        availableToWaitlist: json["available_to_waitlist"],
        isPrintdisabled: json["is_printdisabled"],
        isReadable: json["is_readable"],
        isLendable: json["is_lendable"],
        isPreviewable: json["is_previewable"],
        identifier: json["identifier"],
        isbn: json["isbn"],
        oclc: json["oclc"],
        openlibraryWork: json["openlibrary_work"],
        openlibraryEdition: json["openlibrary_edition"],
        lastLoanDate: json["last_loan_date"] == null
            ? null
            : DateTime.parse(json["last_loan_date"]),
        numWaitlist: json["num_waitlist"],
        lastWaitlistDate: json["last_waitlist_date"] == null
            ? null
            : DateTime.parse(json["last_waitlist_date"]),
        isRestricted: json["is_restricted"],
        isBrowseable: json["is_browseable"],
        src: json["__src__"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "available_to_browse": availableToBrowse,
        "available_to_borrow": availableToBorrow,
        "available_to_waitlist": availableToWaitlist,
        "is_printdisabled": isPrintdisabled,
        "is_readable": isReadable,
        "is_lendable": isLendable,
        "is_previewable": isPreviewable,
        "identifier": identifier,
        "isbn": isbn,
        "oclc": oclc,
        "openlibrary_work": openlibraryWork,
        "openlibrary_edition": openlibraryEdition,
        "last_loan_date": lastLoanDate?.toIso8601String(),
        "num_waitlist": numWaitlist,
        "last_waitlist_date": lastWaitlistDate?.toIso8601String(),
        "is_restricted": isRestricted,
        "is_browseable": isBrowseable,
        "__src__": src,
      };
}
