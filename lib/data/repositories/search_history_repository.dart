import 'package:cinema_app/data/services/movie_db.dart';
import 'package:cinema_app/models/search_history_model.dart';
import 'package:sqflite/sqflite.dart';

class SearchHistoryRepository {
  Future<void> addSearchTerm(SearchHistoryModel history) async {
    final db = await MovieDb.database;
    await db.insert(
      'search_history',
      history.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<SearchHistoryModel>> getHistory() async {
    final db = await MovieDb.database;
    List<Map<String, dynamic>> data = await db.query(
      'search_history',
      orderBy: 'id DESC',
    );

    return data.map((json) => SearchHistoryModel.fromJson(json)).toList();
  }

  Future<void> removeHistoryItem(SearchHistoryModel history) async {
    final db = await MovieDb.database;
    await db.delete(
      'search_history',
      where: 'title = ?',
      whereArgs: [history.title],
    );
  }
}
