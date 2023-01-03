class MovieDetail {
  final int id;
  final String poster_path;
  final String overview;
  final String original_title;
  final String backdrop_path;
  final String release_date;

  MovieDetail.fromMap(Map json)
      : poster_path = json['poster_path'],
        id = json['id'],
        overview = json['overview'],
        original_title = json['original_title'],
        backdrop_path = json['backdrop_path'],
        release_date = json['release_date'];
}
