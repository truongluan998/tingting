import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:tingting/controllers/show_sleep_time_controller.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';
import 'package:tingting/views/widgets/custom_clock/clock.dart';

import '../../constants/dimens.dart';
import '../widgets/alarm/custom_vertical_divider.dart';
import '../widgets/alarm/show_time_sleep.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_title.dart';

class ShowSleepTimeScreen extends StatelessWidget {
  const ShowSleepTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    ShowSleepTimeController showSleepTimeController;

    showSleepTimeController = Get.isRegistered<ShowSleepTimeController>()
        ? Get.find<ShowSleepTimeController>()
        : Get.put(ShowSleepTimeController());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(Dimens.size24),
          child: Obx(
            () => showSleepTimeController.isHaveSleepTime.value
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.size16),
                          ),
                          elevation: Dimens.size0,
                          child: Container(
                            height: size.height * Dimens.size0dot2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimens.size16),
                              gradient: const LinearGradient(
                                colors: [
                                  TingTingAppColor.gradientColorOne,
                                  TingTingAppColor.gradientColorTwo,
                                  TingTingAppColor.gradientColorThree,
                                ],
                                stops: [0.0, 0.7, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: Dimens.size8,
                                  top: Dimens.size8,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      flex: Numbers.numberOne,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: Dimens.size32),
                                        child: Center(
                                          child: CustomTitle(
                                            title: 'title_banner'.tr,
                                            style: theme.bodyText1,
                                            maxLine: Numbers.numberSix,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(flex: Numbers.numberOne, child: const SizedBox())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Dimens.size8),
                        Card(
                          elevation: Dimens.size0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.size16),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(Dimens.size32),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CustomTitle(title: 'show_alarm_title'.tr, style: theme.button),
                                    const Spacer(),
                                    FlutterSwitch(
                                      showOnOff: true,
                                      activeColor: TingTingAppColor.mainColor,
                                      inactiveColor: TingTingAppColor.clockGradientColorTwo,
                                      activeTextColor: TingTingAppColor.whiteColor,
                                      inactiveTextColor: TingTingAppColor.mainColor,
                                      value: showSleepTimeController.isActiveSleep.value,
                                      onToggle: (_) => showSleepTimeController.updateStatusSleepTime(),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: Dimens.size24),
                                  child: Divider(thickness: Dimens.size1),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ShowTimeSleep(
                                      title: 'alarm_setting_to_bed'.tr,
                                      content: showSleepTimeController.showTimeSleep.value.format(context),
                                      icon: Icons.shield_moon_rounded,
                                    ),
                                    CustomVerticalDivider(
                                      height: Dimens.size36,
                                      paddingLeft: Dimens.size8,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: Dimens.size8,
                                        left: Dimens.size4,
                                        bottom: Dimens.size8,
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.access_time_outlined),
                                          SizedBox(width: Dimens.size16),
                                          CustomTitle(
                                            title: showSleepTimeController.showSleepingTime.value +
                                                'alarm_setting_hours_of_sleep'.tr,
                                            style: theme.button,
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            width: Dimens.size48,
                                            height: Dimens.size36,
                                            child: IconButton(
                                              onPressed: () async {
                                                final result = await Get.toNamed("/add_sleep_time");
                                                if (result == 'update') {
                                                  await showSleepTimeController.showSleepTime();
                                                }
                                              },
                                              icon: const Icon(Icons.navigate_next_outlined),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomVerticalDivider(
                                      height: Dimens.size36,
                                      paddingLeft: Dimens.size8,
                                    ),
                                    ShowTimeSleep(
                                      title: 'alarm_setting_wake_up'.tr,
                                      content: showSleepTimeController.showTimeWakeup.value.format(context),
                                      icon: Icons.sunny,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: size.height * Dimens.size0dot02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTitle(title: 'alarm_hello'.tr, style: theme.headline1),
                          CustomTitle(title: 'alarm_add'.tr, style: theme.headline1),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: size.height * Dimens.size0dot45,
                        child: const Clock(),
                      ),
                      AppButton(
                        onPressed: () async {
                          final result = await Get.toNamed("/add_sleep_time");
                          if (result == 'create') {
                            await showSleepTimeController.showSleepTime();
                          }
                        },
                        borderRadius: BorderRadius.circular(Dimens.size36),
                        child: CustomTitle(
                          title: 'alarm_add_btn'.tr,
                          style: theme.button,
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
