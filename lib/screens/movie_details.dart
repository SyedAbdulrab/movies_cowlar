import 'package:flutter/material.dart';
import 'package:movies_cowlar/widgets/movie_poster.dart';

final List<Map<String, dynamic>> genres = [
  {
    'id': 28,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/ePquoeNxJ6vg8U7iSjRAZ2KdztX.jpg',
    'title': 'Action',
    'color': Color.fromRGBO(21, 210, 188, 1),
  },
  {
    'id': 12,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/Ag3D9qXjhJ2FUkrlJ0Cv1pgxqYQ.jpg',
    'title': 'Adventure',
    'color': Colors.blue
  },
  {
    'id': 16,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Animation',
    'color': Colors.orange
  },
  {
    'id': 35,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Comedy',
    'color': Color.fromRGBO(205, 157, 15, 1)
  },
  {
    'id': 80,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/dB6Krk806zeqd0YNp2ngQ9zXteH.jpg',
    'title': 'Crime',
    'color': Colors.red
  },
  {
    'id': 99,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Documentary',
    'color': Colors.purple
  },
  {
    'id': 18,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Drama',
    'color': Colors.teal
  },
  {
    'id': 10751,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Family',
    'color': Colors.deepOrange
  },
  {
    'id': 14,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Fantasy',
    'color': Colors.indigo
  },
  {
    'id': 36,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'History',
    'color': Colors.brown
  },
  {
    'id': 27,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7BpNtNfxuocYEVREzVMO75hso1l.jpg',
    'title': 'Horror',
    'color': Colors.cyan
  },
  {
    'id': 10402,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg',
    'title': 'Music',
    'color': Colors.amber
  },
  {
    'id': 9648,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/l2bqoY9rgPAgugPkOTowIPIv61j.jpg',
    'title': 'Mystery',
    'color': Colors.lightBlue
  },
  {
    'id': 10749,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Romance',
    'color': Colors.pinkAccent
  },
  {
    'id': 878,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Science Fiction',
    'color': Color.fromRGBO(86, 76, 163, 1)
  },
  {
    'id': 10770,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'TV Movie',
    'color': Colors.pink
  },
  {
    'id': 53,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Thriller',
    'color': Color.fromRGBO(226, 108, 165, 1)
  },
  {
    'id': 10752,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg',
    'title': 'War',
    'color': Colors.grey
  },
  {
    'id': 37,
    'image':
        'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
    'title': 'Western',
    'color': Colors.deepPurple
  },
];

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
    
    // Function to get the genre details based on genreId
    Map<String, dynamic> getGenreById(int id) {
      return genres.firstWhere((genre) => genre['id'] == id);
    }

    // Create a list of Chip widgets based on genreIds
    List<Widget> buildGenreChips() {
      return genreIds.map((id) {
        Map<String, dynamic> genre = getGenreById(id);
        return Chip(
          label: Text(genre['title'], style: TextStyle(color: Colors.white)),
          backgroundColor: genre['color'],
          shape: StadiumBorder(),
        );
      }).toList();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          // Movie Poster
          MoviePoster(
              poster: poster,
              movieTitle: title,
              releaseDate: releaseDate,
              movieId: id),
          // Movie Details
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
                const SizedBox(height: 8.0), // Added spacing
                // Genre Chips/Pills
                Wrap(
                  spacing: 8.0,
                  children: buildGenreChips(),
                ),
                const Divider(
                  color: Color.fromARGB(54, 197, 197, 197),
                  height: 24.0,
                  thickness: 2,
                ),
                // Overview Title
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
                // Overview Description
                Text(
                  overview,
                  style: const TextStyle(
                    color: Color.fromRGBO(143, 143, 143, 1),
                    fontSize: 14.0,
                    height: 1.7,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16.0), // Added spacing
                // Genres Heading
              ],
            ),
          ),
        ],
      ),
    );
  }
}
