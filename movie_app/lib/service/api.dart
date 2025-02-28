import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:movie_app/models/cast_model.dart';
import 'package:movie_app/models/movie_mod.dart';
import 'package:flutter/services.dart' as rootBundle;

class Api {
  String apiKey = '';
  final movie_list = 'https://api.themoviedb.org/3/genre/movie/list?';
  final now_playing = 'https://api.themoviedb.org/3/movie/now_playing?';
  final popular = 'https://api.themoviedb.org/3/movie/popular?';
  final top_rated = 'https://api.themoviedb.org/3/movie/top_rated?';
  final upcoming = 'https://api.themoviedb.org/3/movie/upcoming?';
  final search_movie = 'https://api.themoviedb.org/3/search/movie?';
  final movie_details = 'https://api.themoviedb.org/3/movie/';

  Future<void> loadApiKey() async {
    try {
      final jsonApiKey =
          await rootBundle.rootBundle.loadString('assets/config.json');
      final api = jsonDecode(jsonApiKey);
      apiKey = api['apiKey'];
      Logger().i('Api key loaded successfully');
    } catch (e) {
      Logger().e('Failed to load api key: $e');
      throw Exception('Failed to load api key');
    }
  }

  Future<List<MovieModle>> getNowPlaying() async {
    await loadApiKey();
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
  }

  Future<List<MovieModle>> getPopulerMovies() async {
    await loadApiKey();
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
    await loadApiKey();
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
    await loadApiKey();
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

  Future<List<MovieModle>> searchMovies(String query) async {
    await loadApiKey();
    final response =
        await http.get(Uri.parse('${search_movie}query=$query&$apiKey'));
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

  Future<MovieModle?> getmovieDetails(String id) async {
    await loadApiKey();
    try {
      final response = await http.get(Uri.parse('$movie_details$id?$apiKey'));
      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        return MovieModle.fromJson(body);
      } else {
        Logger().e('Failed to fetch data');
        return null;
      }
    } catch (e) {
      Logger().e('Failed to fetch data: $e');
    }
    return null;
  }

  Future<List<CastModel>> getCast(String id) async {
    await loadApiKey();
    final response =
        await http.get(Uri.parse('$movie_details$id/credits?$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> castData = body['cast'];
      List<CastModel> cast = castData
          .map((e) => CastModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return cast;
    } else {
      Logger().e('Failed to fetch data');
      return [];
    }
  }
}
