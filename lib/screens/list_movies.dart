import 'package:cev06_flutter/provider/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class ListMoviesScreen extends StatefulWidget {
  const ListMoviesScreen({Key? key}) : super(key: key);

  @override
  State<ListMoviesScreen> createState() => _ListMoviesScreenState();
}

class _ListMoviesScreenState extends State<ListMoviesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MoviesProvider>(context, listen: false).getAllMovies();
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<MoviesProvider>(context, listen: false).getAllMovies();
  // }

  @override
  Widget build(BuildContext context) {
    bool shadowColor = false;
    double? scrolledUnderElevation;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Popular',
          style:
          TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor:
        shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: Consumer<MoviesProvider>(
        builder: (context, value, child) {
          final loading = value.isLoading;
          // print(loading);
          final movies = value.movies;
          print(movies);

          // return Text('bngvgcgcgcc');
          return ListView.builder(itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.overview),
            );
          }
          );
        },
      ),
    );
  }
}

