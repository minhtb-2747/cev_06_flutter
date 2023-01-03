import 'package:cev06_flutter/model/movie_model.dart';


class Movies {
  final int id;
  final String poster_path;
  final String overview;
  final String original_title;
  final String backdrop_path;
  final String release_date;

  const Movies({
    required this.overview,
    required this.poster_path,
    required this.id,
    required this.original_title,
    required this.backdrop_path,
    required this.release_date,
  });

  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      overview: json['overview'] as String,
      poster_path: json['poster_path'] as String,
      id: json['id'] as int,
      original_title: json['original_title'] as String,
      backdrop_path: json['backdrop_path'] as String,
      release_date: json['release_date'] as String,
    );
  }
}