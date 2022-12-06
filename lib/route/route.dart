import 'package:get/get.dart';
import 'package:tingting/views/screens/add_sleep_time_screen.dart';
import 'package:tingting/views/screens/alarm_screen.dart';
import 'package:tingting/views/screens/to_do_screen.dart';

import '../bindings/bottom_navigation_binding.dart';
import '../views/screens/show_sleep_time_screen.dart';
import '../views/screens/splash_screen.dart';

class CustomRoute {
  static List<GetPage>? initRoute = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/alarm',
      page: () => const AlarmScreen(),
      transition: Transition.cupertino,
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: '/show_alarm',
      page: () => const ShowSleepTimeScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/to_do',
      page: () => const ToDoScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/add_alarm',
      page: () => const AddSleepTimeScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
