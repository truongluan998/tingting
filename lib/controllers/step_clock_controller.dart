import 'dart:async';

import 'package:get/get.dart';

class StepClockController extends GetxController {
  var timeNow = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (_) {
      timeNow = DateTime.now().obs;
      update();
    });
  }
}
