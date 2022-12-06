import 'package:get/get.dart';

import '../controllers/step_clock_controller.dart';

class StepClockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StepClockController>(() => StepClockController());
  }
}
