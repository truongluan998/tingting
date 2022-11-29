import 'package:get/get.dart';
import 'package:tingting/views/screens/add_alarm_screen.dart';
import 'package:tingting/views/screens/alarm_screen.dart';
import 'package:tingting/views/screens/to_do_screen.dart';

import '../bindings/bottom_navigation_binding.dart';
import '../views/screens/show_alarm_screen.dart';
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
      page: () => const ShowAlarmScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/to_do',
      page: () => const ToDoScreen(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: '/add_alarm',
      page: () => const AddAlarmScreen(),
      transition: Transition.cupertino,
    ),
  ];
}
