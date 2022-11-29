import 'package:get/get.dart';

import '../controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../controllers/clock_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.lazyPut<ClockController>(() => ClockController());
  }
}
