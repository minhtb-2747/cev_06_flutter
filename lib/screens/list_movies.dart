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
  int _page = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesProvider>(context, listen: false).getAllMovies(_page);
    });
    scrollController.addListener(_scrollListener);
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Consumer<MoviesProvider>(
        builder: (context, value, child) {
          final loading = value.isLoading;
          final currentPage = value.movies.page;
          final movies = value.movies.results;

          return (loading && currentPage == 1)
              ? const Center(
                  child: Center(
                      child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                )))
              : ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  controller: scrollController,
                  // itemCount: loading ? movies.length + 1 : movies.length,
                  itemCount: movies.length + 1,
                  itemBuilder: (context, index) {
                    if (index == movies.length) {
                      return const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.grey,
                      ));
                    } else {
                      final movie = movies[index];
                      final image = movie.posterPath;
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
                                    movie.originalTitle,
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
                    }
                  });
        },
      ),
    );
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      _page = _page + 1;
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Provider.of<MoviesProvider>(context, listen: false).getAllMovies(_page);
      });
    }
  }
}
