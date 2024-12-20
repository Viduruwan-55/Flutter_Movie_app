import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app/models/movie_mod.dart';

class Api {
  final apiKey = 'api_key=88fb0c68c1491752c7aa00609ec34d3f';
  final movie_list = 'https://api.themoviedb.org/3/genre/movie/list?';
  final now_playing = 'https://api.themoviedb.org/3/movie/now_playing?';
  final popular = 'https://api.themoviedb.org/3/movie/popular?';
  final top_rated = 'https://api.themoviedb.org/3/movie/top_rated?';
  final upcoming = 'https://api.themoviedb.org/3/movie/upcoming?';
  final serch_movie = 'https://api.themoviedb.org/3/search/movie?';

  Future<List<MovieModle>> getNowPlaying() async {
    final response = await http.get(Uri.parse('$now_playing$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<Map<String, dynamic>> movies_list =
          result.map((e) => e as Map<String, dynamic>).toList();
      List<MovieModle> movies =
          movies_list.map((data) => MovieModle.fromJson(data)).toList();
      Logger().f(movies.length);
      return movies;
    } else {
      Logger().e('Failed to fetch data');
      return [];
    }
    // https://api.themoviedb.org/3/movie/now_playing?api_key=88fb0c68c1491752c7aa00609ec34d3f&language=en-US&page=1
  }

  Future<List<MovieModle>> getPopulerMovies() async {
    final response = await http.get(Uri.parse('$popular$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<Map<String, dynamic>> movies_list =
          result.map((e) => e as Map<String, dynamic>).toList();
      List<MovieModle> movies =
          movies_list.map((data) => MovieModle.fromJson(data)).toList();
      Logger().f(movies.length);
      return movies;
    } else {
      Logger().e('Failed to fetch data');
      return [];
    }
  }

  Future<List<MovieModle>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse('$top_rated$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<Map<String, dynamic>> movies_list =
          result.map((e) => e as Map<String, dynamic>).toList();
      List<MovieModle> movies =
          movies_list.map((data) => MovieModle.fromJson(data)).toList();
      Logger().f(movies.length);
      return movies;
    } else {
      Logger().e('Failed to fetch data');
      return [];
    }
  }

  Future<List<MovieModle>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse('$upcoming$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<Map<String, dynamic>> movies_list =
          result.map((e) => e as Map<String, dynamic>).toList();
      List<MovieModle> movies =
          movies_list.map((data) => MovieModle.fromJson(data)).toList();
      Logger().f(movies.length);
      return movies;
    } else {
      Logger().e('Failed to fetch data');
      return [];
    }
  }
}
