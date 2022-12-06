import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/business/sleep_time_business.dart';
import 'package:tingting/models/time_sleep.dart';
import 'package:tingting/uitls/app_utils.dart';
import 'package:tingting/uitls/convert_time.dart';
import 'package:tingting/uitls/string_utils.dart';
import 'package:uuid/uuid.dart';

import '../uitls/convert.dart';

class SleepTimeController extends GetxController {
  var timeNow = DateTime.now().obs;
  var timeSleep = const TimeOfDay(hour: 22, minute: 0).obs;
  var timeWakeup = const TimeOfDay(hour: 6, minute: 0).obs;
  var sleepingTime = ''.obs;

  var listDayOfToSleep = LinkedHashMap().obs;
  var listVoice = LinkedHashMap().obs;

  var isHaveSleepTime = false.obs;
  var isActiveSleep = false.obs;

  Rx<TimeSleep?> timeSleepFromDB = TimeSleep().obs;

  final _sleepTimeBusiness = Get.find<SleepTimeBusiness>();

  @override
  void onInit() async {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (_) {
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

    timeSleepFromDB.value = await _sleepTimeBusiness.getActiveSleepTime();

    if (timeSleepFromDB.value != null &&
        timeSleepFromDB.value?.isActive != null &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.value?.id) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.value?.toBedTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.value?.wakeUpTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.value?.date) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.value?.voice)) {
      isHaveSleepTime.value = true;
      isActiveSleep.value = Convert.convertIntToBool(timeSleepFromDB.value?.isActive ?? 0);

      timeSleep.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.value?.toBedTime ?? '');
      timeWakeup.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.value?.wakeUpTime ?? '');

      _calculateSleepingTime();

      for (var day in timeSleepFromDB.value?.date?.split(',') ?? []) {
        listDayOfToSleep.value.update(day, (value) => true);
      }

      for (var voice in timeSleepFromDB.value?.voice?.split(',') ?? []) {
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
    listVoice.value.updateAll((key, value) => value = false);
    listVoice.value.update(key, (value) => value = !value);
    update();
  }

  Future<void> addSleepTime() async {
    final listDate = listDayOfToSleep.value.keys.where((key) => listDayOfToSleep.value[key] == true).toList();
    final allVoice = listVoice.value.keys.where((key) => listVoice.value[key] == true).toList();

    if (listDate.isNotEmpty && allVoice.isNotEmpty) {
      final setTimeSleep = TimeSleep(
        id: const Uuid().v1(),
        toBedTime: ConvertTime.convertDayOfTimeToString(timeNow.value, timeSleep.value),
        wakeUpTime: ConvertTime.convertDayOfTimeToString(timeNow.value, timeWakeup.value),
        date: StringUtils.onlyString(listDate),
        voice: StringUtils.onlyString(allVoice),
        isActive: Convert.convertBoolToInt(true),
      );

      isHaveSleepTime.value = true;
      await _sleepTimeBusiness.addSleepTime(setTimeSleep);
      Get.back();
    } else {
      AppUtils.showCusTomSnackBar('snack_bar_announce'.tr, 'snack_bar_validate_alarm'.tr);
    }
  }
}
