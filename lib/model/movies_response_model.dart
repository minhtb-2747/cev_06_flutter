class MoviesResponseDetail {
  final int id;
  final String posterPath;
  final String overview;
  final String originalTitle;

  const MoviesResponseDetail({
    required this.overview,
    required this.posterPath,
    required this.id,
    required this.originalTitle,
  });

  factory MoviesResponseDetail.fromJson(Map<String, dynamic> json) {
    return MoviesResponseDetail(
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      id: json['id'] as int,
      originalTitle: json['original_title'] as String,
    );
  }
}

class MoviesResponse {
  final int page;
  final List<MoviesResponseDetail> results;

  const MoviesResponse({
    required this.page,
    required this.results,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
        page: json['page'] as int,
        results: (json['results'] as List)
            .map((e) => MoviesResponseDetail.fromJson(e))
            .toList());
  }
}
