import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'enum.dart';

class ConvertTime {
  static String convertDateTime(DateTime dateTime, ConvertTimeType type) {
    var formatter = DateFormat();
    String formatted = '';

    switch (type) {
      case ConvertTimeType.dmy:
        formatter = DateFormat('yyyy-MM-dd');
        break;
      case ConvertTimeType.hms:
        formatter = DateFormat('Hms');
        break;
      case ConvertTimeType.hm:
        formatter = DateFormat('Hm');
        break;
    }
    formatted = formatter.format(dateTime);
    return formatted;
  }

  static DateTime convertTimeOfDayToDateTime(DateTime dateTime, TimeOfDay timeOfDay) {
    return DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
  }

  static TimeOfDay convertStringToTimeOfDay(String time) {
    return TimeOfDay(hour: int.parse(time.split(":")[0]), minute: int.parse(time.split(":")[1]));
  }

  static String convertDayOfTimeToString(DateTime dateTime, TimeOfDay timeOfDay) {
    final convertToDateTime = convertTimeOfDayToDateTime(dateTime, timeOfDay);
    return convertDateTime(convertToDateTime, ConvertTimeType.hm);
  }
}
