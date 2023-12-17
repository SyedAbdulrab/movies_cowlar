import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Utilities {
  final List<Map<String, dynamic>> genres = [
    {
      'id': 14,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8GFtkImmK0K1VaUChR0n9O61CFU.jpg',
      'title': 'Fantasy',
      'color': Colors.indigo
    },
    {
      'id': 28,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/n6J3zO4TpMoGADJCjjZATm0a3cR.jpg',
      'title': 'Action',
      'color': Colors.green
    },
    {
      'id': 10752,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jE5o7y9K6pZtWNNMEw3IdpHuncR.jpg',
      'title': 'War',
      'color': Colors.grey
    },
    {
      'id': 12,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/yQvGrMoipbRoddT0ZR8tPoR7NfX.jpg',
      'title': 'Adventure',
      'color': Colors.blue
    },
    {
      'id': 10751,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/bVcMIUkUH0pbk5cyPnfUPSEPgj0.jpg',
      'title': 'Family',
      'color': Colors.deepOrange
    },
    {
      'id': 35,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8UYxOsE2LDlF9r4AnwhPwOkiqAy.jpg',
      'title': 'Comedy',
      'color': Colors.yellow
    },
    {
      'id': 80,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/1hdm3Axw9LjITbApvAXBbqO58zE.jpg',
      'title': 'Crime',
      'color': Colors.red
    },
    {
      'id': 36,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      'title': 'History',
      'color': Colors.brown
    },
    {
      'id': 10402,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/ozobdmMlse2FrQtoRhqUHCouSHL.jpg',
      'title': 'Music',
      'color': Colors.amber
    },
   
{
      'id': 18,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/hoYr43FoLioV6M8s48KG5j1aVQS.jpg',
      'title': 'Drama',
      'color': Colors.teal
    },
    {
      'id': 99,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/29HuGDtqCVEdhDCESxrL8oc2S5F.jpg',
      'title': 'Documentary',
      'color': Colors.purple
    },
    
     {
      'id': 16,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/itAKcobTYGpYT8Phwjd8c9hleTo.jpg',
      'title': 'Animation',
      'color': Colors.orange
    },
    
    {
      'id': 27,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/7BpNtNfxuocYEVREzVMO75hso1l.jpg',
      'title': 'Horror',
      'color': Colors.cyan
    },
    
    {
      'id': 9648,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/l2bqoY9rgPAgugPkOTowIPIv61j.jpg',
      'title': 'Mystery',
      'color': Colors.lightBlue
    },
    {
      'id': 10749,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/AbuyfKTHDp7oHxpMKgtEaIZqoU9.jpg',
      'title': 'Romance',
      'color': Colors.deepPurple
    },
    {
      'id': 878,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/vwieCUwMgrXqykVkx1pvMnUkgfB.jpg',
      'title': 'Science Fiction',
      'color': Colors.lime
    },
    {
      'id': 10770,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jkimnO0uO7XqTu7xz5wYSqPC1Nm.jpg',
      'title': 'TV Movie',
      'color': Colors.pink
    },
    {
      'id': 53,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/tLeqhlAKQicrzUoWqbTJH6Ac7Z0.jpg',
      'title': 'Thriller',
      'color': Colors.lightGreen
    },
    {
      'id': 37,
      'image':
          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jxAHZ4TxCjbsRY41XtmXAGh3pdU.jpg',
      'title': 'Western',
      'color': Colors.deepPurple
    },
  ];

  ColorScheme customColorScheme = const ColorScheme(
    // Primary color for your app (e.g., app bar, buttons)
    primary: Color(0xFF61C3F2),

    // Darker variant of the primary color
    primaryContainer: Color(0xFF564CA3),

    // Secondary color for your app (e.g., floating action button)
    secondary: Color(0xFFCD9D0F),

    // Darker variant of the secondary color
    secondaryContainer: Color(0xFFE26CA5),

    // Background color for your app
    background: Color(0xEFEFEF),

    // Surface color for your app (e.g., cards, dialogs)
    surface: Color(0xFFF6F6FA),

    // Error color for indicating errors
    error: Color(0xFFDBDBDF),

    // Text and icons on the primary color
    onPrimary: Color(0x202C43),

    // Text and icons on the secondary color
    onSecondary: Color(0x2E2739),

    // Text and icons on the surface color
    onSurface: Colors.black,

    // Text and icons on the background color
    onBackground: Color.fromARGB(228, 246, 246, 250),

    // Text and icons on the error color
    onError: Colors.black,

    // Brightness of the color scheme (light or dark)
    brightness: Brightness.light,
  );

  String formatDateString(String inputDate) {
    // Parse the input date string
    DateTime parsedDate = DateTime.parse(inputDate);

    // Format the date using the desired format
    String formattedDate = DateFormat('MMMM dd, y').format(parsedDate);

    return formattedDate;
  }
}
