import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              // slivers: [
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SliverToBoxAdapter(
                  //   child:
                  CustomAppBar(),
                  //),
                  const SizedBox(height: 15),
                  // const SliverToBoxAdapter(
                  //child:
                  NowPlayingSlider(),
                  // ),
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
              // ],
            ),
          ),
        ));
  }
}
