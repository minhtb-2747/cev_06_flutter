import 'package:cev06_flutter/constant/constants.dart';
import 'package:cev06_flutter/model/genres_model.dart';
import 'package:cev06_flutter/provider/movie_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

String getMovieGenres(List<GenresDetail>? genres) {
  if (genres != null) {
    return genres.map((e) => e.name).join(", ");
  }
  return '';
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // final MovieDetail movie
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<MovieDetailProvider>(context, listen: false)
          .getMovieDetail(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    double? scrolledUnderElevation;
    bool shadowColor = false;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Movie detail',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: scrolledUnderElevation,
        shadowColor: shadowColor ? Theme.of(context).colorScheme.shadow : null,
      ),
      body: Consumer<MovieDetailProvider>(
        builder: (context, value, child) {
          final movie = value.movieDetailInfo;
          final image = movie?.backdrop_path, releaseDate = movie?.release_date;
          final overview = movie?.overview;
          final genresString = movie?.genres?.map((e) => e.name)?.join(", ");
          return value.isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    )
                  ],
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          width: width,
                          height: 250,
                          child: Image.network(
                            '$SECURE_BASE_URL_IMAGE/w500$image',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: const Text(
                            'Escape From Pretoria',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 10, top: 10),
                          child: const Center(
                              child: Text(
                            "6.5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          )),
                        )

                        // SizedBox(
                        //   height: 30,
                        //   child: Stack(
                        //     children: <Widget>[
                        //       Center(
                        //         child: Container(
                        //           width: 30,
                        //           height: 30,
                        //           child: const CircularProgressIndicator(
                        //             strokeWidth: 5,
                        //             value: 1.0,
                        //           ),
                        //         ),
                        //       ),
                        //       const Center(child: Text("6.5", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!),
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!),
                                    right: BorderSide(
                                        width: 0.6, color: Colors.grey[300]!))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ic_star.png',
                                  width: 20,
                                  height: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text(
                                    'Reviews',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!),
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/ic_play.png',
                                  width: 20,
                                  height: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text(
                                    'Trailers',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!),
                                    right: BorderSide(
                                        width: 0.6, color: Colors.grey[300]!))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Genre',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    genresString!,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.grey[300]!))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Release',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    releaseDate!,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(
                              overview!,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
        },
      ),
    );
  }
}
