import 'package:flutter/material.dart';
import 'package:movies_cowlar/utilities/utilities.dart';
import 'package:movies_cowlar/widgets/genre_card.dart';

List<Map<String, dynamic>> genres = Utilities().genres;


class GenreCardsWidget extends StatelessWidget {
  const GenreCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 2/1.35,
      ),
      itemCount: genres.length,
      itemBuilder: (context, index) {
        final genre = genres[index];
        return GenreCard(
          imageUrl: genre['image']!,
          title: genre['title']!,
          id:genre["id"]
        );
      },
    );
  }
}
