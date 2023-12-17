// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:movies_cowlar/models/movie_model.dart';

// final movieProvider = ChangeNotifierProvider<MovieProvider>((ref) {
//   return MovieProvider();
// });

// class MovieProvider extends ChangeNotifier {
//   List<Movie> _movies = [];

//   List<Movie> get movies => _movies;

//   void setMovies(List<Movie> movies) {
//     _movies = movies;
//     notifyListeners();
//   }

//   List<Movie> getFilteredMovies(String searchTerm) {
//     return _movies
//         .where((movie) =>
//             movie.title.toLowerCase().contains(searchTerm.toLowerCase()))
//         .toList();
//   }
// }


// didn't wanna use Provider. 