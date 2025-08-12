import 'package:cinema_app/data/services/movie_db.dart';
import 'package:cinema_app/models/movie_model.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteMoviesRepository {
  Future<void> addFavoriteMovie(MovieModel movie) async {
    final db = await MovieDb.database;
    await db.insert(
      'movies',
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<MovieModel>> getFavoriteMovies() async {
    final db = await MovieDb.database;
    List<Map<String, dynamic>> data = await db.query(
      'movies',
      orderBy: 'id DESC',
    );

    return data.map((json) => MovieModel.fromLocalJson(json)).toList();
  }

  Future<void> deleteFromFavorites(MovieModel movie) async {
    final db = await MovieDb.database;

    await db.delete('movies', where: 'id = ?', whereArgs: [movie.id]);
  }
}
