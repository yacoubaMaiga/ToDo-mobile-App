import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/task.dart';

class SqlHelper {
  Future<Database> openDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'tasks_management.db'),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''CREATE TABLE tasks(
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              title TEXT NOT NULL,
              description TEXT,
              status INTEGER NOT NULL DEFAULT 0,
              createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
            )''');
      },
    );
  }

  // Inserer une task
  Future<int> insertTask(Task task) async {
    final Database db = await openDB();

    final int id = await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return id;
  }

  // Afficher toutes les tasks
  Future<List<Task>> tasks() async {
    final Database db = await openDB();

    final List<Map<String, Object?>> taskMaps = await db.query('tasks');

    return taskMaps.map((e) => Task.fromMap(e)).toList();
  }

  // Afficher les tasks du jour
  Future<List<Task>> tasksOfDay() async {
    final Database db = await openDB();

    final List<Map<String, Object?>> taskMaps = await db.rawQuery(
      ''' SELECT * FROM tasks
          WHERE DATE(createdAt) = DATE('now') 
      ''',
    );

    return taskMaps.map((e) => Task.fromMap(e)).toList();
  }

  // Supprimer une task
  Future<void> deleteTask(int id) async {
    final db = await openDB();
    await db.delete('tasks', where: "id = ?", whereArgs: [id]);
  }

  Future<void> deleteAllTasks() async {
    final db = await openDB();
    await db.delete('tasks');
  }

  // update data
  Future<void> updateTask(Task task) async {
    final db = await openDB();
    await db.update(
      'tasks',
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
