import 'package:cev06_flutter/model/movies_response_model.dart';
import 'package:cev06_flutter/services/movies_services.dart';
import 'package:flutter/cupertino.dart';

class MoviesProvider extends ChangeNotifier {
  final _movieService = MovieService();
  MoviesResponse _movies = const MoviesResponse(page: 1, results: []);
  MoviesResponse get movies => _movies;

  bool isLoading = true;

  Future<void> getAllMovies(int page) async {
    isLoading = true;
    notifyListeners();
    final response = await _movieService.getMovies(page);
    MoviesResponse responseData = MoviesResponse.fromJson(response);

    _movies = MoviesResponse(page: responseData.page, results: _movies.results + responseData.results);
    isLoading = false;
    notifyListeners();
  }
}
