import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../models/time_sleep.dart';

class SleepTimeBusiness {
  final _dbHelper = Get.find<DBHelper>();

  Future<TimeSleep?> getSleepTime() async {
    final timeSleep = await _dbHelper.getSleepTime();
    if (timeSleep != null) {
      return timeSleep;
    } else {
      return null;
    }
  }

  Future<void> addSleepTime(TimeSleep? timeSleep) async {
    if (timeSleep != null) {
      await _dbHelper.addSleepTime(timeSleep);
    }
  }

  Future<void> deleteAllSleepTime() async {
    await _dbHelper.deleteAllSleepTime();
  }

  Future<void> updateStatusSleepTime(String? id, int? value) async {
    if (id != null && value != null) {
      await _dbHelper.updateStatusSleepTime(id, value);
    }
  }
}
