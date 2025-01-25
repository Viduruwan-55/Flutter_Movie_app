import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/models/movie_mod.dart';
import 'package:movie_app/service/api.dart';

class SearchMovies extends StatefulWidget {
  final String query;
  const SearchMovies({super.key, required this.query});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black26,
        title: Text(widget.query),
        foregroundColor: Colors.grey.shade300,
      ),
      body: FutureBuilder(
          future: Api().searchMovies(widget.query),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError ||
                snapshot.data == null ||
                snapshot.data == []) {
              return Center(
                  child: Text(
                'Error',
                style: GoogleFonts.sansita(fontSize: 20, color: Colors.white24),
              ));
            }
            final List<MovieModle> movies = snapshot.data!;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 170,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(movies[index].posterPath),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
