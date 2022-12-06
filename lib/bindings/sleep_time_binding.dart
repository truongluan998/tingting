import 'package:get/get.dart';

import '../controllers/sleep_time_controller.dart';

class SleepTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SleepTimeController>(() => SleepTimeController());
  }
}
