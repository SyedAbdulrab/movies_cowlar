// movie_service.dart
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";

class MovieService {
  final Dio _dio = Dio();

  final String endpoint =
      'https://api.themoviedb.org/3/trending/movie/week?language=en-US';

  // add to env vars later

  String randomVar = "Store this in Secure storage";

  Future<List<Movie>> fetchMovies() async {
    try {
      final storage = FlutterSecureStorage();
      String? apiKey = await storage.read(key: 'api_key');
      print("API KEY FROM SECURE STORAGE");
      print(apiKey);

      final Map<String, String> headers = {
        'Authorization': 'Bearer $apiKey',
        'accept': 'application/json',
      };
      print("test 1");

      final Response response =
          await _dio.get(endpoint, options: Options(headers: headers));

      print(response);
      if (response.statusCode == 200) {
        final List<Movie> movies = (response.data['results'] as List)
            .map((movieData) => Movie(
                  id: movieData['id'],
                  title: movieData['title'],
                  overview: movieData['overview'],
                  poster: movieData['poster_path'],
                  genreIds:
                      (movieData['genre_ids'] as List<dynamic>).cast<int>(),
                  releaseDate: movieData['release_date'],
                ))
            .toList();

        final Box<Movie> movieBox = Hive.box<Movie>('popmovies');
        movieBox.addAll(movies);
        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Map<String, dynamic>> fetchTrailers(int movieId) async {
    try {
      final storage = FlutterSecureStorage();
      String? apiKey = await storage.read(key: 'api_key');

      final String trailersEndpoint =
          'https://api.themoviedb.org/3/movie/$movieId/videos?language=en-US';
      final Map<String, String> headers = {
        'Authorization': 'Bearer $apiKey',
        'accept': 'application/json',
      };

      final Response response =
          await _dio.get(trailersEndpoint, options: Options(headers: headers));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load trailers');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

// YO, ok so we will make functions here, one can be 
// > movie list from hive function and then we have a filter based on user searh keyword function


