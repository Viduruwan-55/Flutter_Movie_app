import 'package:logger/logger.dart';
import 'package:movie_app/models/company_model.dart';

class MovieModle {
  bool adult;
  String backdropPath;
  List<int>? genre_ids;
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
  String? tagline;
  List<CompanyModel>? companies;

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
    this.tagline,
    this.companies,
  });

  factory MovieModle.fromJson(Map<String, dynamic> json) {
    List<CompanyModel>? companies = [];
    if (json['production_companies'] != null) {
      for (var companyData in (json['production_companies'] as List<dynamic>)) {
        CompanyModel company =
            CompanyModel.fromJson(companyData as Map<String, dynamic>);
        Logger().e(company.name);
        companies.add(company);
      }
    }
    return MovieModle(
      adult: json['adult'],
      backdropPath: 'https://image.tmdb.org/t/p/w500${json['backdrop_path']}',
      genre_ids: json['genre_ids'] != null
          ? (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList()
          : null,
      id: json['id'],
      original_title: json['original_title'],
      overview: json['overview'],
      tagline: json['tagline'],
      companies: companies,
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
