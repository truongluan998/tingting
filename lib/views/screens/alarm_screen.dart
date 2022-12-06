import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/views/screens/show_sleep_time_screen.dart';
import 'package:tingting/views/screens/to_do_screen.dart';

import '../../constants/dimens.dart';
import '../../controllers/bottom_navigation/bottom_navigation_controller.dart';
import '../../theme/ting_ting_app_color.dart';
import '../widgets/alarm/item_navigation_bar.dart';

class AlarmScreen extends GetWidget<BottomNavigationController> {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: const [
            ShowSleepTimeScreen(),
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
            onTap: (index) => controller.changeTabIndex(index),
            currentIndex: controller.tabIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: TingTingAppColor.mainColor,
            iconSize: Dimens.size32,
            items: [
              BottomNavigationBarItem(
                icon: ItemNavigationBar(
                  index: controller.tabIndex.value,
                  matchIndex: Numbers.numberZero,
                  icon: Icons.access_alarm,
                ),
                label: DimenString.emptyText,
              ),
              BottomNavigationBarItem(
                icon: ItemNavigationBar(
                  index: controller.tabIndex.value,
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
