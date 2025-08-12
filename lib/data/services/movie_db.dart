import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class MovieDb {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'movies.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE search_history(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL)',
        );

        await db.execute('''CREATE TABLE movies(
          id INTEGER PRIMARY KEY,
          rating REAL,
          description TEXT,
          shortDescription TEXT,
          name TEXT,
          alternativeName TEXT,
          movieLength INTEGER,
          year INTEGER,
          backdropUrl TEXT,
          posterUrl TEXT,
          genres TEXT,
          countries TEXT
        )''');
      },
    );
  }
}
