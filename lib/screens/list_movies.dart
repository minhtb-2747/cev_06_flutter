import 'package:cev06_flutter/constant/constants.dart';
import 'package:cev06_flutter/provider/movies_provider.dart';
import 'package:cev06_flutter/screens/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListMoviesScreen extends StatefulWidget {
  const ListMoviesScreen({Key? key}) : super(key: key);

  @override
  State<ListMoviesScreen> createState() => _ListMoviesScreenState();
}

class _ListMoviesScreenState extends State<ListMoviesScreen> {
  final int _page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesProvider>(context, listen: false).getAllMovies(_page);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool shadowColor = false;
    double? scrolledUnderElevation;
    double widthBoxImage = 100.0;
    double paddingBox = 10.0;
    double width =
        MediaQuery.of(context).size.width - widthBoxImage - paddingBox * 2;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Popular',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: Consumer<MoviesProvider>(
        builder: (context, value, child) {
          final loading = value.isLoading;
          final movies = value.movies;

          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                final image = movie.poster_path;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) =>
                                MovieDetailScreen(movieId: movie.id)));
                  },
                  child: Card(
                      child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        height: 150,
                        child: Image.network(
                          '$SECURE_BASE_URL_IMAGE/w500$image',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                left: paddingBox,
                                top: paddingBox,
                                right: paddingBox),
                            width: width,
                            child: Text(
                              movie.original_title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: paddingBox,
                                bottom: paddingBox,
                                right: paddingBox),
                            width: width,
                            child: Text(
                              movie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
                );
              });
        },
      ),
    );
  }
}
