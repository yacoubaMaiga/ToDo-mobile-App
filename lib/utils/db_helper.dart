import 'package:sqflite/sqflite.dart' as sql;

class SqlHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      title TEXT,
      content TEXT
    )""");
  }
}
