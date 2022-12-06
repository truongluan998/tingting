import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/utils/string_utils.dart';

import '../business/sleep_time_business.dart';
import '../utils/app_utils.dart';
import '../utils/convert.dart';
import '../utils/convert_time.dart';

class ShowSleepTimeController extends GetxController {
  final _sleepTimeBusiness = Get.find<SleepTimeBusiness>();

  var showTimeSleep = const TimeOfDay(hour: 0, minute: 0).obs;
  var showTimeWakeup = const TimeOfDay(hour: 8, minute: 0).obs;
  var isHaveSleepTime = false.obs;
  var showSleepingTime = ''.obs;
  var isActiveSleep = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await showSleepTime();
  }

  Future<void> showSleepTime() async {
    final timeSleepFromDB = await _sleepTimeBusiness.getSleepTime();

    if (timeSleepFromDB != null) {
      isHaveSleepTime.value = true;

      isActiveSleep.value = Convert.convertIntToBool(timeSleepFromDB.isActive ?? 0);

      showTimeSleep.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.toBedTime ?? '');
      showTimeWakeup.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.wakeUpTime ?? '');

      showSleepingTime.value = AppUtils.calculatorSleepingTime(showTimeSleep.value, showTimeWakeup.value);
    }
  }

  Future<void> updateStatusSleepTime() async {
    final timeSleepFromDB = await _sleepTimeBusiness.getSleepTime();

    if (timeSleepFromDB != null &&
        timeSleepFromDB.isActive != null &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.id)) {
      await _sleepTimeBusiness.updateStatusSleepTime(
        timeSleepFromDB.id,
        Convert.convertBoolToInt(!isActiveSleep.value),
      );
      await showSleepTime();
    }
  }
}
