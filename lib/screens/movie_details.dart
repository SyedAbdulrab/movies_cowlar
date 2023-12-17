import 'package:flutter/material.dart';
import 'package:movies_cowlar/utilities/utilities.dart';
import 'package:movies_cowlar/widgets/movie_poster.dart';

final List<Map<String, dynamic>> genres = Utilities().genres;

class MovieDetailsPage extends StatelessWidget {
  final String title;
  final int id;
  final String overview;
  final String poster;
  final List<int> genreIds;
  final String releaseDate;

  const MovieDetailsPage({
    Key? key,
    required this.id,
    required this.title,
    required this.overview,
    required this.poster,
    required this.genreIds,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> getGenreById(int id) {
      return genres.firstWhere((genre) => genre['id'] == id);
    }

    List<Widget> buildGenreChips() {
      return genreIds.map((id) {
        Map<String, dynamic> genre = getGenreById(id);
        return Chip(
          label: Text(genre['title'], style: TextStyle(color: Colors.white)),
          backgroundColor: genre['color'],
          shape: const StadiumBorder(),
        );
      }).toList();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          MoviePoster(
              poster: poster,
              movieTitle: title,
              releaseDate: releaseDate,
              movieId: id),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Genres',
                  style: TextStyle(
                    color: Color.fromRGBO(32, 44, 67, 1),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8.0), 
                Wrap(
                  spacing: 8.0,
                  children: buildGenreChips(),
                ),
                const Divider(
                  color: Color.fromARGB(54, 197, 197, 197),
                  height: 24.0,
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Overview',
                    style: TextStyle(
                      color: Color.fromRGBO(32, 44, 67, 1),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  overview,
                  style: const TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: 14.0,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
