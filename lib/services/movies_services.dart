import 'dart:convert';
import 'package:cev06_flutter/constant/constants.dart';
import 'package:http/http.dart' as http;

class MovieService {
  configMovies() async {
    const apiKey = 'a0f7b7619cb631f34dfc3dc57653eb37';
    const url = 'https://api.themoviedb.org/3/configuration?api_key=$apiKey';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future getMovies(int page) async {
    final url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&language=en-US&page=$page';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load list movie');
    }
  }

  Future getMovieDetail(int movieId) async {
    final uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId?api_key=$API_KEY&language=en-US');
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      throw Exception('Failed to load movie detail');
    }
  }
}
