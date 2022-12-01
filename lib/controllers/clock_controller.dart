import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/uitls/convert_time.dart';
import 'package:tingting/uitls/date_time_extension.dart';

class ClockController extends GetxController {
  var timeNow = DateTime.now().obs;
  var timeSleep = TimeOfDay.now().obs;
  var timeWakeup = TimeOfDay.now().obs;
  var sleepingTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeNow = DateTime.now().obs;
      update();
    });

    if (timeWakeup.value == timeSleep.value) {
      timeWakeup.value = timeSleep.value.addHour(hour: 8);
    }
    _calculateSleepingTime();
  }

  void setSleepTime(TimeOfDay? time) {
    if (time != null) {
      timeSleep.value = time;
      _calculateSleepingTime();
    }
  }

  void setWakeupTime(TimeOfDay? time) {
    if (time != null) {
      if (timeWakeup.value == timeSleep.value) {
        timeWakeup.value = timeSleep.value.addHour(hour: 8);
      } else {
        timeWakeup.value = time;
        _calculateSleepingTime();
      }
    }
  }

  void _calculateSleepingTime() {
    var sleep = const Duration().obs;

    final startTime = ConvertTime.convertTimeOfDayToDateTime(timeNow.value, timeSleep.value);
    final endTime = ConvertTime.convertTimeOfDayToDateTime(timeNow.value, timeWakeup.value).add(
      const Duration(days: 1),
    );

    sleep.value = endTime.difference(startTime).abs();
    if (sleep.value.inHours >= 24) {
      sleepingTime.value = (sleep.value.inHours - 24).toString();
    } else {
      sleepingTime.value = '${sleep.value.inHours}';
    }
  }
}
