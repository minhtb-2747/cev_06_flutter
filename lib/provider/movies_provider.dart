import 'package:cev06_flutter/model/movies_response_model.dart';
import 'package:cev06_flutter/services/movies_services.dart';
import 'package:flutter/cupertino.dart';

class MoviesProvider extends ChangeNotifier {
  List<MoviesResponseDetail> parseMovies(List responseBodyJson) {
    final parsed = responseBodyJson.cast<Map<String, dynamic>>();
    return parsed.map<MoviesResponseDetail>((json) => MoviesResponseDetail.fromJson(json))
        .toList();
  }

  final _movieService = MovieService();
  List<MoviesResponseDetail> _movies = [];
  List<MoviesResponseDetail> get movies => _movies;

  int _page = 1;

  get crrPage => _page;
  bool isLoading = false;

  Future<void> getAllMovies(int page) async {
    isLoading = true;
    notifyListeners();
    final response = await _movieService.getMovies(page);
    _page = response['page'];
    _movies = parseMovies(response['results'] as List);
    isLoading = true;
    notifyListeners();
  }
}
