import 'package:tingting/models/time_sleep.dart';

abstract class DBRepository {
  Future<void> addSleepTime(TimeSleep? timeSleep);
  Future<TimeSleep?> getActiveSleepTime();
  Future<TimeSleep?> updateSleepTime(String? id);
  Future<void> deleteAllSleepTime();
}