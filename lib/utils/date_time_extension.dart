import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay addHour({int hour = 0}) {
    return replacing(hour: this.hour + hour);
  }

  TimeOfDay subtractHour({int hour = 0}) {
    return replacing(hour: this.hour - hour);
  }
}
