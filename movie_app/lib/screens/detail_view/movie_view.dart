import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/models/movie_mod.dart';
import 'package:movie_app/service/api.dart';

class MovieView extends StatefulWidget {
  final MovieModle movie;
  const MovieView({super.key, required this.movie});

  @override
  State<MovieView> createState() => MovieViewState();
}

class MovieViewState extends State<MovieView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height / 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  image: DecorationImage(
                    image: NetworkImage(widget.movie.backdropPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.transparent,
                            ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Wrap(children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              widget.movie.title,
                              maxLines: 1,
                              style: GoogleFonts.roboto(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    SafeArea(
                      child: BackButton(
                        color: Colors.white,
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Colors.black.withOpacity(0.4))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 130,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(widget.movie.posterPath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(widget.movie.overview,
                              style: GoogleFonts.lato(
                                  color: Colors.grey.shade200,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text('Production Companies',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: Api().getmovieDetails(widget.movie.id.toString()),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }
                        if (snapshot.hasError ||
                            snapshot.data == null ||
                            snapshot.data == []) {
                          return Center(
                            child: Text(
                              'Error',
                              style: GoogleFonts.sansita(
                                  fontSize: 20, color: Colors.white24),
                            ),
                          );
                        }
                        final movie = snapshot.data;
                        return Column(
                          children:
                              List.generate(movie.companies!.length, (index) {
                            final logo_path = movie.companies![index].logo;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: ListTile(
                                tileColor: Colors.grey.shade800,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                leading:
                                    (logo_path != null && logo_path.isNotEmpty)
                                        ? Image.network(
                                            logo_path,
                                            width: 100,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Icon(
                                                  Icons.image_not_supported,
                                                  color: Colors.grey);
                                            },
                                          )
                                        : const Icon(Icons.image_not_supported,
                                            color: Colors.grey),
                                title: Text(
                                  movie.companies![index].name,
                                  style: GoogleFonts.lato(
                                      color: Colors.grey.shade200,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text('Top Billed Cast',
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    FutureBuilder(
                      future: Api().getCast(widget.movie.id.toString()),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }
                        if (snapshot.hasError ||
                            snapshot.data == null ||
                            snapshot.data == []) {
                          return Center(
                            child: Text(
                              'Error',
                              style: GoogleFonts.sansita(
                                  fontSize: 20, color: Colors.white24),
                            ),
                          );
                        }
                        final List<CastModel> cast = snapshot.data;
                        return Column(
                            children: List.generate(cast.length, (index) {
                          final profilePath = cast[index].profilePath;
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: profilePath != null &&
                                      profilePath.isNotEmpty
                                  ? NetworkImage(profilePath)
                                  : const AssetImage(
                                          'assets/images/default_avatar.png')
                                      as ImageProvider, // Provide a default image
                            ),
                            title: Text(
                              cast[index].name,
                              style: GoogleFonts.lato(
                                color: Colors.grey.shade200,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              cast[index].character ?? '',
                              style: GoogleFonts.lato(
                                color: Colors.grey.shade400,
                                fontSize: 12,
                              ),
                            ),
                          );
                        }));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
