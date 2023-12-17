import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movies_cowlar/services/movie_service.dart';

class TrailerScreen extends StatefulWidget {
  final int movieId;

  const TrailerScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  String? movieKey;

  @override
  void initState() {
    super.initState();
    fetchAndSetTrailerKey();
  }

  Future<void> fetchAndSetTrailerKey() async {
    try {
      print('movie id ====> ${widget.movieId}');
      final movieService = MovieService();
      final trailersResponse = await movieService.fetchTrailers(widget.movieId);
      print(trailersResponse);

      setState(() {
        movieKey = extractTrailerKey(trailersResponse);
      });

      print('Trailer Key: $movieKey');
    } catch (error) {
      print('Error fetching trailer: $error');
    }
  }

  String extractTrailerKey(Map<String, dynamic> trailersResponse) {
    final List<dynamic> results = trailersResponse['results'];
    for (final trailer in results) {
      if (trailer['type'] == 'Trailer') {
        return trailer['key'];
      }
    }
    throw Exception('No trailer found');
  }

  @override
  Widget build(BuildContext context) {
    if (movieKey == null) {
      // Show a circular progress indicator while fetching
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('movie name',style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: movieKey!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Trailer Screen'),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors: ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
