import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_mod.dart';

class MovieView extends StatefulWidget {
  final MovieModle movie;
  const MovieView({super.key, required this.movie});

  @override
  State<MovieView> createState() => MovieViewState();
}

class MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Movie View'),
      ),
    );
  }
}
