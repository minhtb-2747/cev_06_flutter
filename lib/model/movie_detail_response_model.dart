import 'package:cev06_flutter/model/genres_model.dart';

class MovieInfoResponse {
  final int id;
  final String posterPath;
  final String overview;
  final String originalTitle;
  final String backdropPath;
  final String releaseDate;
  final List<GenresDetail> genres;
  final double voteAverage;

  const MovieInfoResponse(
      {required this.overview,
      required this.posterPath,
      required this.id,
      required this.originalTitle,
      required this.backdropPath,
      required this.releaseDate,
      required this.genres,
      required this.voteAverage});

  factory MovieInfoResponse.fromJson(Map<String, dynamic> json) {
    return MovieInfoResponse(
        overview: json['overview'] as String,
        posterPath: json['poster_path'] as String,
        id: json['id'] as int,
        originalTitle: json['original_title'] as String,
        backdropPath: json['backdrop_path'] as String,
        releaseDate: json['release_date'] as String,
        genres: (json['genres'] as List)
            .map((e) => GenresDetail.fromJson(e))
            .toList(),
        voteAverage: json['vote_average']);
  }
}
