
import 'dart:async';

import 'package:get/get.dart';

class ClockController extends GetxController {
  var time = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time = DateTime.now().obs;
      update();
    });
  }
}
