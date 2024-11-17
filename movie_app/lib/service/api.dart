import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class Api {
  final apiKey = 'api_key=88fb0c68c1491752c7aa00609ec34d3f';
  final movie_list = 'https://api.themoviedb.org/3/genre/movie/list?';
  final now_playing = 'https://api.themoviedb.org/3/movie/now_playing?';

  Future<void> getNowPlaying() async {
    final response = await http.get(Uri.parse('$now_playing$apiKey'));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> result = body['results'];
      List<Map<String, dynamic>> movies =
          result.map((e) => e as Map<String, dynamic>).toList();
      Logger().f(movies[0]);
    } else {
      Logger().e('Failed to fetch data');
    }
    // https://api.themoviedb.org/3/movie/now_playing?api_key=88fb0c68c1491752c7aa00609ec34d3f&language=en-US&page=1
  }

  //api.themoviedb.org/3/genre/movie/list?api_key=88fb0c68c1491752c7aa00609ec34d3f&language=en-US;
}
