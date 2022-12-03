import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tingting/models/time_sleep.dart';
import 'package:tingting/repository/clock_repository.dart';

class DBHelper extends ClockRepository {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "tingting.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (
      Database db,
      int version,
    ) async {
      /// TODO: Implement in future
      await db.execute("CREATE TABLE TimeSleep ("
          // "id Text,"
          // "toBedTime TEXT,"
          // "wakeUpTime TEXT,"
          // "date TEXT,"
          // "dayOfWeek TEXT,"
          // "voice TEXT,"
          // "isActive INT"
          ")");
    });
  }

  @override
  Future<void> addSleepTime(TimeSleep timeSleep) {
    // TODO: implement addSleepTime
    throw UnimplementedError();
  }

  @override
  Future<TimeSleep> getSleepTime() {
    // TODO: implement getSleepTime
    throw UnimplementedError();
  }

  @override
  Future<TimeSleep> updateSleepTime(String id) {
    // TODO: implement updateSleepTime
    throw UnimplementedError();
  }
}
