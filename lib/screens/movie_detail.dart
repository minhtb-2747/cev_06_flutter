import 'package:cev06_flutter/constant/constants.dart';
import 'package:cev06_flutter/gen/assets.gen.dart';
import 'package:cev06_flutter/model/genres_model.dart';
import 'package:cev06_flutter/provider/movie_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

String getMovieGenres(List<GenresDetail> genres) {
  return genres.map((e) => e.name).join(", ");
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
      ),
      body: Consumer<MovieDetailProvider>(
        builder: (context, value, child) {
          final movie = value.movieDetailInfo;
          final image = movie.backdropPath, releaseDate = movie.releaseDate;
          final posterImage = movie.posterPath;
          final overview = movie.overview;
          final genresString = getMovieGenres(movie.genres);
          String voteAverage =
              double.parse((movie.voteAverage).toStringAsFixed(1)).toString();
          return value.isLoading
              ? const Center(
                  child: Center(
                      child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                )))
              : Column(
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
                                width: width,
                                height: 200,
                                child: Image.network(
                                  '$SECURE_BASE_URL_IMAGE/w500$image',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 10,
                          child: SizedBox(
                            width: 90,
                            height: 130,
                            child: Image.network(
                              '$SECURE_BASE_URL_IMAGE/w500$posterImage',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: width - 50,
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            movie.originalTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5, right: 10),
                          child: CircularPercentIndicator(
                            radius: 15,
                            animation: true,
                            animationDuration: 1000,
                            lineWidth: 4,
                            percent: movie.voteAverage / 10,
                            progressColor: Colors.black,
                            backgroundColor: Colors.grey,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: Text(voteAverage,
                                style: const TextStyle(fontSize: 8)),
                          ),
                        )
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
                                  Assets.images.icStar.path,
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
                                  Assets.images.icPlay.path,
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
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom:
                            BorderSide(width: 2.0, color: Colors.grey[300]!),
                      )),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 0.6,
                                          color: Colors.grey[300]!))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Genres',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      genresString,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Release',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      releaseDate,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(overview, textAlign: TextAlign.justify),
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // guide: https://www.youtube.com/watch?v=xuatM4pZkNk
    // https://shapemaker.web.app/
    final path0 = Path();
    path0.moveTo(0, size.height * 0.6464000);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, size.height * 0.0016500);
    path0.lineTo(0, size.height * 0.6464000);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
