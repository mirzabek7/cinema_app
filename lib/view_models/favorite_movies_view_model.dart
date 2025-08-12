import 'package:cinema_app/data/repositories/favorite_movies_repository.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class FavoriteMoviesViewModel extends ChangeNotifier {
  final FavoriteMoviesRepository repository;
  FavoriteMoviesViewModel(this.repository);

  List<MovieModel> _favoriteMovies = [];
  List<MovieModel> get favoriteMovies => _favoriteMovies;
  String error = '';

  Future<void> loadFavoriteMovies() async {
    try {
      _favoriteMovies = await repository.getFavoriteMovies();
    } catch (e) {
      error = e.toString();
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> addToFavorites(MovieModel movie) async {
    _favoriteMovies.insert(0, movie);
    notifyListeners();
    try {
      await repository.addFavoriteMovie(movie);
    } catch (e) {
      error = e.toString();
    } finally {}
  }

  Future<void> removeFromToFavorites(MovieModel movie) async {
    _favoriteMovies.remove(movie);
    notifyListeners();
    try {
      await repository.deleteFromFavorites(movie);
    } catch (e) {
      error = e.toString();
    } finally {}
  }
}
