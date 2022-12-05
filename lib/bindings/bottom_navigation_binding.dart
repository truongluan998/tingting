import 'package:get/get.dart';
import 'package:tingting/business/clock_business.dart';
import 'package:tingting/database/db_helper.dart';

import '../controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../controllers/clock_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.lazyPut<DBHelper>(() => DBHelper());
    Get.lazyPut<ClockBusiness>(() => ClockBusiness());
    Get.lazyPut<ClockController>(() => ClockController());
  }
}
