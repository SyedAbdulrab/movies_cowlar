import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:movies_cowlar/services/movie_service.dart';

class TrailerScreen extends StatefulWidget {
  final int movieId;
  final String movie;
  const TrailerScreen({Key? key, required this.movieId,required this.movie}) : super(key: key);

  @override
  _TrailerScreenState createState() => _TrailerScreenState();
}

class _TrailerScreenState extends State<TrailerScreen> {
  String? movieKey;
  late YoutubePlayerController _controller; 

  @override
  void initState() {
    super.initState();
    fetchAndSetTrailerKey();
  }

  @override
  void dispose() {
    _controller.pause(); 
    _controller.dispose();
    super.dispose();
  }

  Future<void> fetchAndSetTrailerKey() async {
    try {
      print('movie id ====> ${widget.movieId}');
      final movieService = MovieService();
      final trailersResponse = await movieService.fetchTrailers(widget.movieId);
      print(trailersResponse);

      setState(() {
        movieKey = extractTrailerKey(trailersResponse);
        _controller = YoutubePlayerController( 
          initialVideoId: movieKey!,
          flags: const YoutubePlayerFlags(
            autoPlay: true,
            mute: false,
          ),
        );
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
      
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title:  Text(
            widget.movie,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body:const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.movie,style: const TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller, 
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          progressColors:const ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
