import 'package:get/get.dart';
import 'package:tingting/business/sleep_time_business.dart';
import 'package:tingting/database/db_helper.dart';

import '../controllers/bottom_navigation/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(() => BottomNavigationController());
    Get.lazyPut<DBHelper>(() => DBHelper());
    Get.lazyPut<SleepTimeBusiness>(() => SleepTimeBusiness());
  }
}
