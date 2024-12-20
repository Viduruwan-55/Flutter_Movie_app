import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          future: Future.delayed(const Duration(seconds: 3)),
          builder: (context, AsyncSnapshot) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 170,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://media.themoviedb.org/t/p/w220_and_h330_face/hklQwv6QVoOp5bWyh1bjuF2ydyG.jpg'),
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
