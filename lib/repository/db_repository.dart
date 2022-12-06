import 'package:tingting/models/time_sleep.dart';

abstract class DBRepository {
  Future<void> addSleepTime(TimeSleep? timeSleep);
  Future<TimeSleep?> getSleepTime();
  Future<void> updateStatusSleepTime(String? id, int? value);
  Future<void> deleteAllSleepTime();
}