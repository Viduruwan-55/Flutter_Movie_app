import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieTempalte extends StatelessWidget {
  final Future<List<dynamic>> future;
  const MovieTempalte({
    required this.future,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
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

          final List movies = snapshot.data!;
          return SizedBox(
            height: 188,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: movies.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    width: 125,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(movies[index].posterPath),
                            fit: BoxFit.cover)),
                    //
                  ),
                );
              },
            ),
          );
        });
  }
}
