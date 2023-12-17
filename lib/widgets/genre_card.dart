import 'package:flutter/material.dart';

class GenreCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int id;

  const GenreCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
              imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 16.0,
              left: 14.0,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
