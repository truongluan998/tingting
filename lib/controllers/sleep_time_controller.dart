import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/business/sleep_time_business.dart';
import 'package:tingting/models/time_sleep.dart';
import 'package:tingting/utils/app_utils.dart';
import 'package:tingting/utils/convert_time.dart';
import 'package:tingting/utils/string_utils.dart';
import 'package:uuid/uuid.dart';

import '../utils/convert.dart';

class SleepTimeController extends GetxController {
  var timeSleep = const TimeOfDay(hour: 22, minute: 0).obs;
  var timeWakeup = const TimeOfDay(hour: 6, minute: 0).obs;
  var sleepingTime = ''.obs;

  var listDayOfToSleep = LinkedHashMap().obs;
  var listVoice = LinkedHashMap().obs;

  var isUpdate = false.obs;

  final _sleepTimeBusiness = Get.find<SleepTimeBusiness>();

  @override
  void onInit() async {
    super.onInit();
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

    final timeSleepFromDB = await _sleepTimeBusiness.getSleepTime();

    if (timeSleepFromDB != null &&
        timeSleepFromDB.isActive != null &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.id) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.toBedTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.wakeUpTime) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.date) &&
        StringUtils.isNotNullOrEmpty(timeSleepFromDB.voice)) {
      isUpdate.value = true;

      timeSleep.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.toBedTime ?? '');
      timeWakeup.value = ConvertTime.convertStringToTimeOfDay(timeSleepFromDB.wakeUpTime ?? '');

      sleepingTime.value = AppUtils.calculatorSleepingTime(timeSleep.value, timeWakeup.value);

      for (var day in timeSleepFromDB.date?.split(',') ?? []) {
        listDayOfToSleep.value.update(day, (value) => true);
      }

      for (var voice in timeSleepFromDB.voice?.split(',') ?? []) {
        listVoice.value.update(voice, (value) => true);
      }
    }
    update();
  }

  void _calculateSleepingTime() {
    sleepingTime.value = AppUtils.calculatorSleepingTime(timeSleep.value, timeWakeup.value);
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
        toBedTime: ConvertTime.convertDayOfTimeToString(timeSleep.value),
        wakeUpTime: ConvertTime.convertDayOfTimeToString(timeWakeup.value),
        date: StringUtils.onlyString(listDate),
        voice: StringUtils.onlyString(allVoice),
        isActive: Convert.convertBoolToInt(true),
      );

      await _sleepTimeBusiness.deleteAllSleepTime();
      await _sleepTimeBusiness.addSleepTime(setTimeSleep);
      Get.back(result: isUpdate.value ? 'update' : 'create');
    } else {
      AppUtils.showCusTomSnackBar('snack_bar_announce'.tr, 'snack_bar_validate_alarm'.tr);
    }
  }
}
