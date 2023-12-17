import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import 'package:movies_cowlar/screens/movie_details.dart';
import 'package:movies_cowlar/widgets/genre_cards.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count += 1;
    notifyListeners();
  }
}

class _MovieListState extends State<MovieList> {
  bool showSearchIcon = true;
  bool isSearchFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    final CounterModel _counter = CounterModel();

    final Box<Movie> movieBox = Hive.box<Movie>('popmovies');
    final List<Movie> movies = movieBox.values.toList();

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        title: const Padding(
          padding:  EdgeInsets.only(left:8.0),
          child:  Text('Watch',
              style: TextStyle(fontSize: 18, color: Colors.black)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(
              onPressed: () {
                print('aiyyo');
              },
              icon: showSearchIcon
                  ? const Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
            ),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        color: Theme.of(context).colorScheme.surface,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 335 / 180,
          ),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(
                      id:movie.id,
                      title: movie.title,
                      overview: movie.overview,
                      poster: movie.poster,
                      genreIds: movie.genreIds,
                      releaseDate: movie.releaseDate,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w600_and_h900_bestv2${movie.poster}",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 25.0,
                        left: 12.0,
                        child: Text(
                          movie.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
