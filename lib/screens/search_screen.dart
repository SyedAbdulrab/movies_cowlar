import 'package:flutter/material.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import 'package:movies_cowlar/providers/movie_search_provider.dart';
import 'package:movies_cowlar/screens/movie_details.dart';
import 'package:movies_cowlar/utilities/utilities.dart';
import 'package:movies_cowlar/widgets/genre_cards.dart';
import 'package:movies_cowlar/widgets/movie_tile.dart';
import 'package:provider/provider.dart';

List<Map<String, dynamic>> genres = Utilities().genres;

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MovieSearchProvider(),
      child: _SearchScreenContent(),
    );
  }
}

class _SearchScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MovieSearchProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(213, 235, 234, 234),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: provider.searchController,
                onSubmitted: (value) {
                  provider.searchMovies(value);
                  provider.submittedSearch = true;
                  print("User submitted: $value");
                },
                onChanged: (value) {
                  provider.searchMovies(value);
                  provider.submittedSearch = false;
                  print("User input: $value");
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 12, 10, 10),
                  hintText: 'Search Movies...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      provider.clearSearch();
                    },
                  ),
                  filled: true,
                  fillColor: const Color.fromRGBO(239, 239, 239, 1),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              )
            ],
          ),
        ),
      ),
      body: provider.submittedSearch
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 8, 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Results found: ${provider.filteredMovies.length}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1.0,
                    height: 8.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.filteredMovies.length,
                    itemBuilder: (context, index) {
                      final movie = provider.filteredMovies[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetailsPage(
                                  releaseDate: movie.releaseDate,
                                  id: movie.id,
                                  title: movie.title,
                                  overview: movie.overview,
                                  poster: movie.poster,
                                  genreIds: movie.genreIds,
                                ),
                              ),
                            );
                          },
                          child: MovieTile(
                            imageUrl: movie.poster,
                            title: movie.title,
                            genre: getGenreTitle(movie.genreIds[0]),
                          ));
                    },
                  ),
                ),
              ],
            )
          : provider.isSearchEmpty
              ? const Padding(
                  padding: EdgeInsets.fromLTRB(6, 18, 6, 8),
                  child: GenreCardsWidget(),
                )
              : Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 12, 8, 8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Top Results',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 1.0,
                        height: 8.0,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.filteredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = provider.filteredMovies[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailsPage(
                                    id: movie.id,
                                    releaseDate: movie.releaseDate,
                                    title: movie.title,
                                    overview: movie.overview,
                                    poster: movie.poster,
                                    genreIds: movie.genreIds,
                                  ),
                                ),
                              );
                            },
                            child: MovieTile(
                              imageUrl: movie.poster,
                              title: movie.title,
                              genre: getGenreTitle(movie.genreIds[0]),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}


String getGenreTitle(int genreId) {
  final genre = genres.firstWhere(
    (element) => element['id'] == genreId,
    orElse: () =>
        {'title': 'Unknown Genre'}, // Default value if genre is not found
  );

  return genre['title'];
}