import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/business/clock_business.dart';
import 'package:tingting/models/time_sleep.dart';
import 'package:tingting/uitls/convert_time.dart';
import 'package:tingting/uitls/string_utils.dart';
import 'package:uuid/uuid.dart';

class ClockController extends GetxController {
  var timeNow = DateTime.now().obs;
  var timeSleep = const TimeOfDay(hour: 22, minute: 0).obs;
  var timeWakeup = const TimeOfDay(hour: 6, minute: 0).obs;
  var sleepingTime = ''.obs;

  var listDayOfToSleep = LinkedHashMap().obs;
  var listVoice = LinkedHashMap().obs;

  final _clockBusiness = Get.find<ClockBusiness>();

  @override
  void onInit() async {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeNow = DateTime.now().obs;
      update();
    });
    _calculateSleepingTime();
    await _initSleepTime();
  }

  Future<void> _initSleepTime() async {
    listDayOfToSleep.value.addAll({
      'mo': false,
      'tu': false,
      'we': false,
      'th': false,
      'fr': false,
      'sa': false,
      'su': false,
    });
    listVoice.value.addAll({
      'men': false,
      'woman': false,
      'robot': false,
      'ghost': false,
    });

    final timeSleepFromDB = await _clockBusiness.getSleepTime();

    if (timeSleepFromDB != null &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.id) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.toBedTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.wakeUpTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.date) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.voice)) {
      timeSleep.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.toBedTime ?? '');
      timeWakeup.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.wakeUpTime ?? '');

      _calculateSleepingTime();

      for (var day in timeSleepFromDB.date?.split(',') ?? []) {
        listDayOfToSleep.value.update(day, (value) => true);
      }

      for (var voice in timeSleepFromDB.voice?.split(',') ?? []) {
        listVoice.value.update(voice, (value) => true);
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

  void choiceDaySleep(String key) {
    listDayOfToSleep.value.update(key, (value) => value = !value);
    update();
  }

  void choiceVoice(String key) {
    listVoice.value.update(key, (value) => value = !value);
    update();
  }

  Future<void> addSleepTime() async {
    var setTimeSleep = TimeSleep(
      id: const Uuid().v1(),
      toBedTime: ConvertTime.convertDayOfTimeToString(timeNow.value, timeSleep.value),
      wakeUpTime: ConvertTime.convertDayOfTimeToString(timeNow.value, timeWakeup.value),
      date: StringUtils.onlyString(
          listDayOfToSleep.value.keys.where((key) => listDayOfToSleep.value[key] == true).toList()),
      voice: StringUtils.onlyString(listVoice.value.keys.where((key) => listVoice.value[key] == true).toList()),
    );

    await _clockBusiness.addSleepTime(setTimeSleep);
  }
}
