// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, prefer_const_declarations, no_leading_underscores_for_local_identifiers
/*
import 'package:reminder/models/doctor.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  static Database? db;
  static final int _version = 1;
  static final String _tableName = "doctors";
  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'doctors.db';
      db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
            "name STRING, medicalSpeciality TEXT, phoneNumber STRING, "
            "city STRING, street STRING, )",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Doctor? doctor) async {
    print("insert function called");
    return await db?.insert(_tableName, doctor!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await db!.query(_tableName);
  }

  static delete(Doctor doctor) async {
    await db!.delete(_tableName, where: 'name=?', whereArgs: [doctor.name]);
  }
}


*/








/*



class Database {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "tasks";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'tasks.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one");
          return db.execute(
            "CREATE TABLE $_tableName("
            "id INTEGER PRIMARY KEY AUTOINCREMENT, "
            "title STRING, note TEXT, date STRING, "
            "startTime STRING, endTime STRING, "
            "remind INTEGER, repeat STRING, "
            "color INTEGER, "
            "isCompleted INTEGER)",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Task? task) async {
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Task task) async {
    await _db!.delete(_tableName, where: 'id=?', whereArgs: [task.id]);
  }

  static update(int id) async {
    return await _db!.rawUpdate('''
UPDATE tasks
SET isCompleted = ?
WHERE id =?
 ''', [1, id]);
  }
}
*/