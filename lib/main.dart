// main.dart
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import 'package:movies_cowlar/screens/home_screen.dart';
import 'package:movies_cowlar/screens/search_screen.dart';
import 'package:movies_cowlar/screens/favorites_screen.dart';
import 'package:movies_cowlar/screens/profile_screen.dart';
import 'package:movies_cowlar/services/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_cowlar/utilities/utilities.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MovieAdapter());
  print('hello jee 1');
  await Hive.openBox<Movie>('popmovies');

  print('hello jee 2');

  final Box<Movie> movieBox = Hive.box<Movie>('popmovies');
  print('hello jee 3');
  // movieBox.clear();

  if (movieBox.isEmpty) {
    print('hello jee 4');

    final List<Movie> movies = await MovieService().fetchMovies();
    print(movies);
    movieBox.addAll(movies);
  }

  print('hello jee 5');

  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MovieList(),
    const SearchScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];
  
  ColorScheme customColorScheme = Utilities().customColorScheme;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        textTheme:
            const TextTheme(bodyMedium: TextStyle(fontFamily: 'Poppins')),
        primarySwatch: Colors.blue,
        colorScheme: customColorScheme,
      ),
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        extendBodyBehindAppBar: true,
        body: _screens[_currentIndex],
        bottomNavigationBar:  ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12,vertical:12 ),
            color: Color.fromRGBO(46, 39, 47, 1),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              elevation: 10,
              selectedFontSize: 15, // Increase font size
              unselectedFontSize: 14, // Increase font size
              selectedLabelStyle:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, // Increase font size
              ),
              unselectedLabelStyle:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14, // Increase font size
              ),
              iconSize: 26, // Increase icon size
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
