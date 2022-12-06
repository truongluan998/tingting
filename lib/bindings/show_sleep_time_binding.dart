import 'package:get/get.dart';

import '../controllers/show_sleep_time_controller.dart';

class ShowSleepTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowSleepTimeController>(() => ShowSleepTimeController());
  }
}
