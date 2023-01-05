import 'package:cev06_flutter/model/movie_detail_response_model.dart';
import 'package:cev06_flutter/services/movies_services.dart';
import 'package:flutter/cupertino.dart';

class MovieDetailProvider extends ChangeNotifier {
  final _movieService = MovieService();
  MovieInfoResponse _movieDetail = const MovieInfoResponse(
      overview: '',
      poster_path: '',
      id: 0,
      original_title: '',
      backdrop_path: '',
      release_date: '',
      genres: []);

  MovieInfoResponse get movieDetailInfo => _movieDetail;
  bool isLoading = true;

  Future<void> getMovieDetail(int movieId) async {
    isLoading = true;
    notifyListeners();
    final response = await _movieService.getMovieDetail(movieId);
    _movieDetail = MovieInfoResponse.fromJson(response);
    isLoading = false;
    notifyListeners();
  }
}
