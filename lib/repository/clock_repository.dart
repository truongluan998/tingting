import 'package:tingting/models/time_sleep.dart';

abstract class ClockRepository {
  Future<void> addSleepTime(TimeSleep timeSleep);
  Future<TimeSleep> getSleepTime();
  Future<TimeSleep> updateSleepTime(String id);
}