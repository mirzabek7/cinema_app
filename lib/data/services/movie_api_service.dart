import 'dart:convert';

import '../../models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  final String baseUrl = 'https://api.kinopoisk.dev';

  final Map<String, String> headers = {
    'accept': 'application/json',
    'X-API-KEY': '0Q7NXKB-VT943WE-J14CN9S-0Q2CMBR',
  };

  Future<List<MovieModel>> fetchLastTopMovies() async {
    final String endPoint =
        '/v1.4/movie?page=1&limit=5&type=movie&year=2020-2025&rating.kp=7-10&rating.imdb=7-10&votes.kp=250000-6666666&votes.imdb=250000-6666666&countries.name=%D0%A1%D0%A8%D0%90';

    final uri = Uri.parse('$baseUrl$endPoint');
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List docs = data['docs'];

      return docs.map((doc) => MovieModel.fromJson(doc)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<List<MovieModel>> fectMoviesByCategory(String category) async {
    String endPoint = '';
    switch (category) {
      case 'now':
        endPoint =
            '/v1.4/movie?page=1&limit=12&type=movie&year=2025&votes.kp=30000-6666666&votes.imdb=30000-6666666';
        break;

      case 'upcoming':
        endPoint =
            '/v1.4/movie?page=1&limit=12&notNullFields=poster.url&type=movie&status=post-production&countries.name=%D0%A1%D0%A8%D0%90';
        break;

      case 'popular':
        endPoint =
            '/v1.4/movie?page=1&limit=12&votes.kp=500000-6666666&votes.imdb=700000-6666666';
        break;

      case 'top':
        endPoint =
            '/v1.4/movie?page=1&limit=12&sortField=top250&sortType=-1&type=movie&rating.kp=7-10&rating.imdb=7-10&countries.name=%D0%A1%D0%A8%D0%90&lists=top250';
        break;
    }

    final uri = Uri.parse('$baseUrl$endPoint');
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List docs = data['docs'];
      return docs.map((doc) => MovieModel.fromJson(doc)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    String searchQuery = query.replaceAll(' ', '%20');
    final String endPoint =
        '/v1.4/movie/search?page=1&limit=24&query=$searchQuery';

    final uri = Uri.parse('$baseUrl$endPoint');
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List docs = data['docs'];

      return docs.map((doc) => MovieModel.fromJson(doc)).toList();
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
