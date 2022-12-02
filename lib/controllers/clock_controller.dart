import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/uitls/convert_time.dart';
import 'package:tingting/uitls/date_time_extension.dart';

class ClockController extends GetxController {
  var timeNow = DateTime.now().obs;
  var timeSleep = const TimeOfDay(hour: 22, minute: 0).obs;
  var timeWakeup = const TimeOfDay(hour: 6, minute: 0).obs;
  var sleepingTime = ''.obs;

  var listDayOfToSleep = HashMap().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeNow = DateTime.now().obs;
      update();
    });
    if (listDayOfToSleep.value.keys.isEmpty) {
      initListDayOfToSleep();
    }
    _calculateSleepingTime();
  }

  initListDayOfToSleep() {
    listDayOfToSleep.value.addAll({
      'mo': false,
      'tu': false,
      'we': false,
      'th': false,
      'fr': false,
      'sa': false,
      'su': false,
    });
  }

  void setSleepTime(TimeOfDay? time) {
    if (time != null) {
      timeSleep.value = time;
      _calculateSleepingTime();
    }
  }

  void setWakeupTime(TimeOfDay? time) {
    if (time != null) {
      timeWakeup.value = time;
      _calculateSleepingTime();
    }
  }

  void _calculateSleepingTime() {
    var sleep = const Duration().obs;

    final startTime =
        ConvertTime.convertTimeOfDayToDateTime(timeNow.value, timeSleep.value);
    final endTime =
        ConvertTime.convertTimeOfDayToDateTime(timeNow.value, timeWakeup.value)
            .add(
      const Duration(days: 1),
    );

    sleep.value = endTime.difference(startTime).abs();
    if (sleep.value.inHours >= 24) {
      sleepingTime.value = (sleep.value.inHours - 24).toString();
    } else {
      sleepingTime.value = '${sleep.value.inHours}';
    }
  }

  void pickDaySleep(String key) {
    listDayOfToSleep.value.update(key, (value) => value = !value);
    update();
  }
}
