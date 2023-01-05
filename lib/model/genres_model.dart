class GenresDetail {
  final int id;
  final String name;

  const GenresDetail({
    required this.id,
    required this.name,
  });

  factory GenresDetail.fromJson(Map<String, dynamic> json) {
    return GenresDetail(
      name: json['name'] as String,
      id: json['id'] as int,
    );
  }
}
