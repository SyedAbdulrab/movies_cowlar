// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_cowlar/models/movie_model.dart';
import 'package:movies_cowlar/providers/movie_search_provider.dart';
import 'package:movies_cowlar/screens/home_screen.dart';
import 'package:movies_cowlar/screens/search_screen.dart';
import 'package:movies_cowlar/screens/favorites_screen.dart';
import 'package:movies_cowlar/screens/profile_screen.dart';
import 'package:movies_cowlar/services/movie_service.dart';
import 'package:movies_cowlar/utilities/utilities.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
    
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(MovieAdapter());
  await Hive.openBox<Movie>('popmovies');

  final Box<Movie> movieBox = Hive.box<Movie>('popmovies');
  // movieBox.clear();

  final secureStorage = FlutterSecureStorage();
  await secureStorage.write(key: 'api_key', value: dotenv.env['API_KEY']);
  
  if (movieBox.isEmpty) {
    final List<Movie> movies = await MovieService().fetchMovies();
    print(movies);
    movieBox.addAll(movies);
  }

  runApp( const MyApp());
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MovieSearchProvider> (create: (context)=>MovieSearchProvider() )
      ],
      child: MaterialApp(
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
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                selectedFontSize: 15, 
                unselectedFontSize: 14, 
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, 
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, 
                ),
                iconSize: 26, 
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
      ),
    );
  }
}
