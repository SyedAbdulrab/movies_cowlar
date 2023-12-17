import "package:flutter/material.dart";
import "package:movies_cowlar/models/movie_model.dart";
import "package:movies_cowlar/screens/tickets_screen.dart";
import "package:movies_cowlar/screens/trailer_screen.dart";
import "package:movies_cowlar/utilities/utilities.dart";
class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.poster, required this.movieTitle, required this.releaseDate, required this.movieId});
  final String poster;
  final String movieTitle;
  final String releaseDate;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    Utilities _utilities = Utilities();
    return Stack(
            children: [
              Image.network(
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2$poster",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.57,
                width: double.infinity,
              ),
              // Back Arrow and Watch Text
              Positioned(
                top: 4.0,
                left: 6.0,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Watch',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Release Date in the Middle
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 0,
                right: 0,
                child:  Center(
                  child: Text(
                    'In Theatres ${_utilities.formatDateString(releaseDate)}', // Replace with the actual release date
                    style:const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              // Get Tickets and Watch Trailer Buttons
              Positioned(
                top: MediaQuery.of(context).size.height * 0.355,
                left: 16.0,
                right: 16.0,
                child: Column(
                  children: [
                    // Get Tickets Button
                    ElevatedButton(
                      
                      onPressed: () {
                         print("VROOOOOOOOOM");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return TicketsScreen(releaseDate: _utilities.formatDateString(releaseDate),movieTitle: movieTitle,);
                          },));
                      },
                      
                      child:  const Text(
                        'Get Tickets',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 54),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    const SizedBox(height: 8.0), // Adjusted spacing
                    // Watch Trailer Button
                    OutlinedButton.icon(
                      onPressed: () {
                        print("VROOOOOOOOOM");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return TrailerScreen(movieId:movieId);
                          },));
                        },
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text(
                        'Watch Trailer',
                        style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side:  BorderSide(color:  Theme.of(context).colorScheme.primary),
                        minimumSize: const Size(double.infinity, 54),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}