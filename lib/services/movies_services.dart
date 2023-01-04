import 'dart:convert';

import 'package:cev06_flutter/constant/constants.dart';
import 'package:cev06_flutter/model/movie_detail_response_model.dart';
import 'package:cev06_flutter/model/movies_response_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Set<MoviesResponse> empty = {};
  Set<MovieInfoResponse> emptyInfo = {};

  configMovies() async {
    const apiKey = 'a0f7b7619cb631f34dfc3dc57653eb37';
    const url = 'https://api.themoviedb.org/3/configuration?api_key=$apiKey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    }
    return empty;
  }

  Future getMovies(int page) async {
    page = page ??= 1;
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&language=en-US&page=$page';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    }
    return empty;
  }

  Future getMovieDetail(int movieId) async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$API_KEY&language=en-US');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    }
    return emptyInfo;
  }
}
