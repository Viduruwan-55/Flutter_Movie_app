import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:movie_app/screens/search_movies/search_movies.dart';
import 'package:movie_app/service/api.dart';

import './widgets/custom_app_bar.dart';

import 'widgets/now_playing_slider.dart';
import 'widgets/movieTempalte_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.8,
                        child: TextField(
                          controller: _queryController,
                          decoration: InputDecoration(
                            hintText: 'Search here',
                            hintStyle: GoogleFonts.sansita(
                                color: Colors.white, fontSize: 15),
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade800,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Logger().i(_queryController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => SearchMovies(
                                      query: _queryController.text))));
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.shade800,
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const NowPlayingSlider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'Popular Movies',
                          style: GoogleFonts.iceland(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 10),
                      MovieTempalte(future: Api().getPopulerMovies()),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'Top Rated Movies',
                          style: GoogleFonts.iceland(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 10),
                      MovieTempalte(future: Api().getTopRatedMovies()),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 2),
                        child: Text(
                          'Upcoming Movies',
                          style: GoogleFonts.iceland(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Divider(
                        color: Colors.grey.shade500,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      const SizedBox(height: 10),
                      MovieTempalte(
                        future: Api().getUpcomingMovies(),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
