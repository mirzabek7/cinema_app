import 'package:cinema_app/data/repositories/movie_repository.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final MovieRepository repository;

  HomeViewModel(this.repository);

  String errorMessage = '';
  List<String> categories = ['now', 'upcoming', 'top', 'popular'];

  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCategoryMovieLoading = false;
  bool get isCategoryMovieLoading => _isCategoryMovieLoading;

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  List<MovieModel> _moviesByCategory = [];
  List<MovieModel> get moviesByCategory => _moviesByCategory;

  void changeIndex(int newIndex) {
    if (newIndex != _currentTabIndex) {
      _currentTabIndex = newIndex;
      loadMoviesByCategory(categories[newIndex]);
      notifyListeners();
    }
  }

  Future<void> loadMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await repository.getMovies();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMoviesByCategory(String category) async {
    _isCategoryMovieLoading = true;
    notifyListeners();

    try {
      _moviesByCategory = await repository.getCategoryMovies(category);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _isCategoryMovieLoading = false;
      notifyListeners();
    }
  }
}
