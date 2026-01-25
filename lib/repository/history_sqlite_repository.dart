import 'package:imc_calculator/model/history_sqlite_model.dart';
import 'package:imc_calculator/repository/database_sqlite.dart';

class HistorySqliteRepository {
  Future<List<HistorySqliteModel>> getData() async {
    final List<HistorySqliteModel> history = [];
    final db = await DatabaseSqlite().getDatabase();
    final result = await db.rawQuery(
      'SELECT id, calculatedIMC, date FROM history ORDER BY date DESC',
    );
    for (final element in result) {
      history.add(HistorySqliteModel.fromMap(element));
    }
    return history;
  }

  Future<int> save(HistorySqliteModel historySqliteModel) async {
    final db = await DatabaseSqlite().getDatabase();
    return await db.insert('history', historySqliteModel.toMap());
  }

  Future<int> update(HistorySqliteModel historySqliteModel) async {
    final db = await DatabaseSqlite().getDatabase();
    return await db.update(
      'history',
      historySqliteModel.toMap(),
      where: 'id = ?',
      whereArgs: [historySqliteModel.id],
    );
  }

  Future<int> remove(int id) async {
    final db = await DatabaseSqlite().getDatabase();
    return await db.delete('history', where: 'id = ?', whereArgs: [id]);
  }
}
