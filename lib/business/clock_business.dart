import 'package:get/get.dart';

import '../database/db_helper.dart';
import '../models/time_sleep.dart';

class ClockBusiness {
  final _dbHelper = Get.find<DBHelper>();

  Future<TimeSleep?> getActiveSleepTime() async {
    final timeSleep = await _dbHelper.getActiveSleepTime();
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
}
