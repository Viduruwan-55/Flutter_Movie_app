class MovieModle {
  bool adult;
  String backdropPath;
  List<int> genre_ids;
  int id;
  String original_title;
  String overview;
  String title;
  double popularity;
  String posterPath;
  String releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  MovieModle({
    required this.adult,
    required this.backdropPath,
    required this.genre_ids,
    required this.id,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.title,
  });

  factory MovieModle.fromJson(Map<String, dynamic> json) {
    return MovieModle(
      adult: json['adult'],
      backdropPath: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
      genre_ids:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: 'https://image.tmdb.org/t/p/w500${json['poster_path']}',
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      title: json['title'],
    );
  }
}
