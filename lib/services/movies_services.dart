import 'dart:convert';

import 'package:cev06_flutter/model/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieService {

  // done
  List<Movies> parseMovies(List responseBodyJson) {
    final parsed = responseBodyJson.cast<Map<String, dynamic>>();

    return parsed.map<Movies>((json) => Movies.fromJson(json)).toList();
  }

   Future<List<Movies>> getMovies() async {
    const apiKey = 'a0f7b7619cb631f34dfc3dc57653eb37';
    const url =
        'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['results'] as List;
      return  parseMovies(json); //done
    }
    return [];
  }
}
