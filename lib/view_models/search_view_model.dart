import 'package:cinema_app/data/repositories/movie_repository.dart';
import 'package:cinema_app/data/repositories/search_history_repository.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:cinema_app/models/search_history_model.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  final MovieRepository repository;
  final SearchHistoryRepository searchHistoryRepository;
  SearchViewModel(this.repository, this.searchHistoryRepository);

  List<SearchHistoryModel> _history = [];
  List<SearchHistoryModel> get history => _history;
  String error = '';

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  bool _isInputEmpty = true;
  bool get isInputEmpty => _isInputEmpty;

  void checkInput(String query) {
    if (query.isEmpty) {
      _isInputEmpty = true;
      getHistory();
      notifyListeners();
    }
  }

  Future<void> getHistory() async {
    _isSearching = true;
    notifyListeners();
    try {
      _history = await searchHistoryRepository.getHistory();
    } catch (e) {
      error = e.toString();
    } finally {
      _isSearching = false;
      notifyListeners();
    }
  }

  Future<void> addItemToHistory(String query) async {
    if (!_history.contains(SearchHistoryModel(id: 0, title: query))) {
      try {
        await searchHistoryRepository.addSearchTerm(
          SearchHistoryModel(id: 0, title: query),
        );
      } catch (e) {
        error = e.toString();
      }
    }
  }

  Future<void> deleteSearch(SearchHistoryModel history) async {
    try {
      _history.remove(history);
      notifyListeners();
      await searchHistoryRepository.removeHistoryItem(history);
    } catch (e) {
      error = e.toString();
    }
  }

  Future<void> search(String query) async {
    if (query.isNotEmpty) {
      _isInputEmpty = false;
      _isSearching = true;
      notifyListeners();
      addItemToHistory(query);
      try {
        _movies = [];
        _movies = await repository.searchMovies(query);
      } catch (e) {
        error = e.toString();
      } finally {
        _isSearching = false;
        notifyListeners();
      }
    }
  }
}
