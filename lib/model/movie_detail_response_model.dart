import 'package:cev06_flutter/model/genres_model.dart';

class MovieInfoResponse {
  final int id;
  final String poster_path;
  final String overview;
  final String original_title;
  final String backdrop_path;
  final String release_date;
  final List<GenresDetail> genres;

  const MovieInfoResponse({
    required this.overview,
    required this.poster_path,
    required this.id,
    required this.original_title,
    required this.backdrop_path,
    required this.release_date,
    required this.genres,
  });

  factory MovieInfoResponse.fromJson(Map<String, dynamic> json) {
    return MovieInfoResponse(
        overview: json['overview'] as String,
        poster_path: json['poster_path'] as String,
        id: json['id'] as int,
        original_title: json['original_title'] as String,
        backdrop_path: json['backdrop_path'] as String,
        release_date: json['release_date'] as String,
        genres: (json['genres'] as List)
            .map((e) => GenresDetail.fromJson(e))
            .toList());
  }
}
