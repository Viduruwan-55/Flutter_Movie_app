import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/detail_view/movie_view.dart';

import '../../../models/movie_mod.dart';
import '../../../service/api.dart';

class NowPlayingSlider extends StatelessWidget {
  const NowPlayingSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Api().getNowPlaying(),
        builder: (context, AsyncSnapshot) {
          if (AsyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (AsyncSnapshot.hasError ||
              AsyncSnapshot.data == null ||
              AsyncSnapshot.data == []) {
            return Center(
                child: Text(
              'Error',
              style: GoogleFonts.sansita(fontSize: 20, color: Colors.white24),
            ));
          }

          final List<MovieModle> movies = AsyncSnapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
                height: 230.0, autoPlay: true, viewportFraction: 0.93),
            items: movies.map((movie) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieView(
                                    movie: movies[movies.indexOf(movie)],
                                  )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25.0),
                          image: DecorationImage(
                            image: NetworkImage(movie.backdropPath),
                            fit: BoxFit.cover,
                          )),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Wrap(children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${movie.title}',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.0,
                                      color: Colors.white54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Wrap(children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withOpacity(0.7),
                                    //.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${movie.voteAverage.toStringAsFixed(1)}',
                                        maxLines: 1,
                                        style: GoogleFonts.robotoMono(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}
