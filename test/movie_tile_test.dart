import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_cowlar/widgets/movie_tile.dart';

void main() {
  testWidgets('MovieTile displays the correct title and genre', (WidgetTester tester) async {
    const String testTitle = 'Inception';
    const String testGenre = 'Action, Sci-Fi';
    const String testImageUrl = '/tLeqhlAKQicrzUoWqbTJH6Ac7Z0.jpg'; // Replace with a valid image URL

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieTile(
            title: testTitle,
            genre: testGenre,
            imageUrl: testImageUrl,
          ),
        ),
      ),
    );

    final titleFinder = find.text(testTitle);
    final genreFinder = find.text(testGenre);
    
    expect(titleFinder, findsOneWidget);
    expect(genreFinder, findsOneWidget);
  });

  testWidgets('MovieTile displays the image correctly', (WidgetTester tester) async {
    const String testImageUrl = '/tLeqhlAKQicrzUoWqbTJH6Ac7Z0.jpg'; // Replace with a valid image URL

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieTile(
            title: 'Test Title',
            genre: 'Test Genre',
            imageUrl: testImageUrl,
          ),
        ),
      ),
    );

    final imageFinder = find.byWidgetPredicate(
      (widget) => widget is Image && widget.image is NetworkImage && (widget.image as NetworkImage).url.contains(testImageUrl),
    );

    expect(imageFinder, findsOneWidget);
  });
}