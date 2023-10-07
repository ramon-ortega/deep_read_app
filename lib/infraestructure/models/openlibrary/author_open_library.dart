class AuthorOpenLibrary {
  final String key;
  final String name;

  AuthorOpenLibrary({
    required this.key,
    required this.name,
  });

  factory AuthorOpenLibrary.fromJson(Map<String, dynamic> json) =>
      AuthorOpenLibrary(
        key: json["key"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
      };
}
