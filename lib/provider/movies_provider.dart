import 'package:cev06_flutter/services/movies_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:cev06_flutter/model/movies_model.dart';

class MoviesProvider extends ChangeNotifier {
  final _movieService = MovieService();
  List<Movies> _movies = [];

  List<Movies> get movies => _movies;

  final int _page = 1;
   get crrPage => _page;

  bool isLoading = false;

  Future<void> getAllMovies() async {
    isLoading = true;
    notifyListeners();
    final response = await _movieService.getMovies();
    // print(response);
    _movies = response;
    isLoading = true;
    notifyListeners();
  }
}
