class MoviesResponseDetail {
  final int id;
  final String poster_path;
  final String overview;
  final String original_title;
  final String backdrop_path;
  final String release_date;

  const MoviesResponseDetail({
    required this.overview,
    required this.poster_path,
    required this.id,
    required this.original_title,
    required this.backdrop_path,
    required this.release_date,
  });

  factory MoviesResponseDetail.fromJson(Map<String, dynamic> json) {
    return MoviesResponseDetail(
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      id: json['id'] as int,
      original_title: json['original_title'] as String,
      backdrop_path: json['backdrop_path'] as String,
      release_date: json['release_date'] as String,
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
        page: json['id'] as int, results: json['results'] as List<MoviesResponseDetail>);
  }
}
