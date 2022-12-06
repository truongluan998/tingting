import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tingting/models/time_sleep.dart';
import 'package:tingting/repository/db_repository.dart';

class DBHelper extends DBRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE TimeSleep (id TEXT PRIMARY KEY, toBedTime TEXT, wakeUpTime TEXT, date TEXT, voice TEXT, isActive INTEGER)');
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tingting.db");
    print(path);
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: _onCreate);
  }

  @override
  Future<void> addSleepTime(TimeSleep? timeSleep) async {
    final db = await database;
    try {
      if (timeSleep != null) {
        db.insert('TimeSleep', timeSleep.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
    } catch (_) {}
  }

  @override
  Future<TimeSleep?> getSleepTime() async {
    final db = await database;
    try {
      final result = await db.rawQuery("SELECT * FROM TimeSleep");
      if (result.isNotEmpty) {
        return TimeSleep.fromJson(result.first);
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  @override
  Future<void> updateStatusSleepTime(String? id, int? value) async {
    final db = await database;
    try {
      if (id != null && value != null) {
        await db.rawQuery("UPDATE TimeSleep SET isActive='$value' WHERE id='$id'");
      }
    } catch (_) {}
  }

  @override
  Future<void> deleteAllSleepTime() async {
    final db = await database;
    try {
      await db.rawQuery("DELETE FROM TimeSleep");
    } catch (_) {}
  }
}
