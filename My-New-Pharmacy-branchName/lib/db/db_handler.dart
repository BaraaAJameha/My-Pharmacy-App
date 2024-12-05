// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, prefer_const_declarations, no_leading_underscores_for_local_identifiers, unused_import
/*
import 'package:reminder/easy%20contact/addPharmacy_screen.dart';
import 'package:reminder/models/pharmacy.dart';
import 'package:sqflite/sqflite.dart';

class DataHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "pharmacy";
  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'pharmacy.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new pharmacy");
          return db.execute(
            "CREATE TABLE $_tableName("
            " PRIMARY KEY (name), "
            "name STRING, phoneNumber STRING, "
            "city STRING, street STRING",
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(Pharmacy? pharmacy) async {
    print("insert function called");
    return await _db?.insert(_tableName, pharmacy!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    print("query function called");
    return await _db!.query(_tableName);
  }

  static delete(Pharmacy pharmacy) async {
    await _db!.delete(_tableName, where: 'name=?', whereArgs: [pharmacy.name]);
  }
}
*/