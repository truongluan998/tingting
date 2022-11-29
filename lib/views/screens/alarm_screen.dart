import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/views/screens/show_alarm_screen.dart';
import 'package:tingting/views/screens/to_do_screen.dart';

import '../../constants/dimens.dart';
import '../../controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../../theme/ting_ting_app_color.dart';
import '../widgets/alarm/item_navigation_bar.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavController = Get.find<BottomNavigationController>();

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: bottomNavController.tabIndex.value,
          children: const [
            ShowAlarmScreen(),
            ToDoScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            unselectedItemColor: TingTingAppColor.whiteColor,
            selectedItemColor: TingTingAppColor.mainColor,
            onTap: (index) => bottomNavController.changeTabIndex(index),
            currentIndex: bottomNavController.tabIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: TingTingAppColor.mainColor,
            iconSize: Dimens.size32,
            items: [
              BottomNavigationBarItem(
                icon: ItemNavigationBar(
                  index: bottomNavController.tabIndex.value,
                  matchIndex: Numbers.numberZero,
                  icon: Icons.access_alarm,
                ),
                label: DimenString.emptyText,
              ),
              BottomNavigationBarItem(
                icon: ItemNavigationBar(
                  index: bottomNavController.tabIndex.value,
                  matchIndex: Numbers.numberOne,
                  icon: Icons.check_circle_outline,
                ),
                label: DimenString.emptyText,
              )
            ],
          ),
        ),
      ),
    );
  }
}