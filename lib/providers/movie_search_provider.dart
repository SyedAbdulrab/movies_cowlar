import 'package:flutter/material.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import 'package:hive/hive.dart';

class MovieSearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<Movie> movies = [];
  List<Movie> filteredMovies = [];
  bool isSearchEmpty = true;
  bool submittedSearch = false;

  MovieSearchProvider() {
    _initializeMovies();
  }

  Future<void> _initializeMovies() async {
    final Box<Movie> movieBox = await Hive.openBox<Movie>('popmovies');
    
    movies = movieBox.values.toList();
    filteredMovies = List.from(movies);
    notifyListeners();
  }

  void searchMovies(String query) {
    final input = query.toLowerCase();
    final uniqueMoviesMap = <String, Movie>{};

    for (final movie in movies) {
      final movieTitle = movie.title.toLowerCase();
      if (movieTitle.contains(input)) {
        uniqueMoviesMap[movieTitle] = movie;
      }
    }

    final uniqueMovies = uniqueMoviesMap.values.toList();

    filteredMovies = uniqueMovies;
    isSearchEmpty = query.isEmpty;

    notifyListeners();
  }

  void clearSearch() {
    searchController.clear();
    searchMovies('');
  }
}
