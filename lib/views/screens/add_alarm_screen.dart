import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';
import 'package:tingting/views/widgets/custom_title.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../constants/dimens.dart';
import '../canvas/time_sleep_painter.dart';
import '../widgets/alarm/choice_day.dart';
import '../widgets/alarm/choice_voice.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_clock/circle_clock.dart';

class AddAlarmScreen extends StatelessWidget {
  const AddAlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    /// TODO: hard code to test
    var isHaveSleepTime = true;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: TingTingAppColor.mainColor,
            size: Dimens.size32,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Dimens.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: () => showTimeRangePicker(
                    context: context,
                    onStartChange: (start) {
                      /// TODO: handle start time
                    },
                    onEndChange: (end) {
                      /// TODO: handle end time
                    },
                    interval: const Duration(minutes: 30),
                    minDuration: const Duration(minutes: 30),
                    use24HourFormat: true,
                    padding: Dimens.size32,
                    strokeWidth: Dimens.size20,
                    handlerRadius: Dimens.size14,
                    strokeColor: TingTingAppColor.clockBoxShadow,
                    handlerColor: TingTingAppColor.mainColor,
                    selectedColor: TingTingAppColor.mainColor,
                    backgroundColor: TingTingAppColor.addAlarmScaffoldColor,
                    ticks: Numbers.numberTwentyFour,
                    ticksColor: TingTingAppColor.whiteColor,
                    snap: true,
                    labels: TimeRanger.labelTime.asMap().entries.map((e) {
                      return ClockLabel.fromIndex(
                        idx: e.key,
                        length: Numbers.numberEight,
                        text: e.value,
                      );
                    }).toList(),
                    labelOffset: Dimens.negativeOffset30,
                    labelStyle: theme.subtitle2,
                    timeTextStyle: theme.subtitle1!.copyWith(fontSize: Dimens.size24),
                    activeTimeTextStyle: theme.subtitle1,
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleClock(
                          isBoxConstraints: true,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              TingTingAppColor.clockGradientColorOne,
                              TingTingAppColor.clockGradientColorTwo,
                            ],
                          ),
                          offsetOne: Dimens.size40,
                          offsetTwo: Dimens.size20,
                          offsetThree: Dimens.negativeSize20,
                          offsetFour: Dimens.negativeSize10,
                        ),
                        CircleClock(
                          width: size.width * Dimens.size0dot5,
                          height: size.height * Dimens.size0dot25,
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              TingTingAppColor.smallClockGradientColorOne,
                              TingTingAppColor.smallClockGradientColorTwo,
                            ],
                          ),
                          offsetOne: Dimens.size10,
                          offsetTwo: Dimens.size5,
                          offsetThree: Dimens.negativeSize10,
                          offsetFour: Dimens.negativeSize5,
                        ),
                        SizedBox(
                          width: size.width * Dimens.size0dot5,
                          height: size.height * Dimens.size0dot25,
                          child: isHaveSleepTime
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomTitle(title: 'to bed', style: theme.button),
                                    CustomTitle(title: '23:30', style: theme.headline3),
                                    SizedBox(height: Dimens.size16),
                                    CustomTitle(title: '8 hours of sleep', style: theme.button),
                                    SizedBox(height: Dimens.size16),
                                    CustomTitle(title: '07:30', style: theme.headline3),
                                    CustomTitle(title: 'wake up', style: theme.button),
                                  ],
                                )
                              : Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTitle(
                                        title: 'alarm_setting_sleep_time'.tr,
                                        style: theme.button,
                                        isCenterTitle: true,
                                      ),
                                      const Icon(Icons.shield_moon)
                                    ],
                                  ),
                                ),
                        ),
                        Container(
                          constraints: const BoxConstraints.expand(),
                          child: CustomPaint(
                            painter: TimeSleepPainter(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimens.size24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceDay(
                      title: 'alarm_mo'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_tu'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_we'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_th'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_fr'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_sa'.tr,
                      press: () {},
                    ),
                    ChoiceDay(
                      title: 'alarm_su'.tr,
                      press: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Dimens.size32,
                  left: Dimens.size16,
                  right: Dimens.size16,
                  bottom: Dimens.size16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(title: 'alarm_voice'.tr, style: theme.button),
                    ChoiceVoice(
                      title: 'alarm_voice_men'.tr,
                      icon: Icons.man_sharp,
                      press: () {},
                    ),
                    ChoiceVoice(
                      title: 'alarm_voice_woman'.tr,
                      icon: Icons.woman_sharp,
                      press: () {},
                    ),
                    ChoiceVoice(
                      title: 'alarm_voice_robot'.tr,
                      icon: Icons.ac_unit,
                      press: () {},
                    ),
                    ChoiceVoice(
                      title: 'alarm_voice_ghost'.tr,
                      icon: Icons.account_circle_sharp,
                      press: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Dimens.size16,
                  right: Dimens.size16,
                ),
                child: AppButton(
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(Dimens.size16),
                  child: CustomTitle(
                    title: 'alarm_voice_create'.tr,
                    style: theme.button,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
