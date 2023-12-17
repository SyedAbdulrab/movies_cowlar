// movie_model.dart
import 'package:hive_flutter/hive_flutter.dart';
// movie_model.dart

import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Movie {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String poster;

  @HiveField(3)
  final List<int> genreIds;

  @HiveField(4)
  final String overview;

  @HiveField(5)
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.genreIds,
    required this.overview,
    required this.releaseDate,

  });
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    return Movie(
      id: reader.read(),
      title: reader.read(),
      poster: reader.read(),
      genreIds: (reader.readList()).cast<int>(), // Explicit casting
      overview: reader.read(),
      releaseDate: reader.read()
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.poster);
    writer.writeList(obj.genreIds);
    writer.write(obj.overview);
    writer.write(obj.releaseDate);
  }
}

// imp note:-
// MovieAdapter is a class that extends TypeAdapter<Movie>. 
//This tells Hive how to convert 
//your Movie objects to and from binary form, 
//so they can be stored and retrieved efficiently.


// Movie read(BinaryReader reader): This method is called when reading a Movie object from Hive. 
//It specifies how to reconstruct a Movie object from binary data.

// void write(BinaryWriter writer, Movie obj): This method is called when writing a Movie object to Hive. 
//It specifies how to convert a Movie object into binary form.