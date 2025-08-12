import 'package:cinema_app/data/services/movie_api_service.dart';
import 'package:cinema_app/models/movie_model.dart';

class MovieRepository {
  final MovieApiService service;

  MovieRepository(this.service);

  Future<List<MovieModel>> getMovies() async {
    final movies = await service.fetchLastTopMovies();
    return movies;
  }

  Future<List<MovieModel>> getCategoryMovies(String category) async {
    final categoryMovies = await service.fectMoviesByCategory(category);
    return categoryMovies;
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final movies = await service.searchMovies(query);
    return movies;
  }
}
