import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String genre;

  const MovieTile(
      {required this.imageUrl, required this.title, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: SizedBox(
          width: 80,
          height: 200, 
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: 3 / 4, 
              child: Image.network(
                "https://image.tmdb.org/t/p/w600_and_h900_bestv2${imageUrl}",
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              genre,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        trailing: const Icon(
          Icons.more_horiz,
          color: Colors.blue,
        ),
      ),
    );
  }
}