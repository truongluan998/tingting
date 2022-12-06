import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';
import 'package:tingting/views/widgets/custom_title.dart';
import 'package:time_range_picker/time_range_picker.dart';

import '../../constants/dimens.dart';
import '../../controllers/sleep_time_controller.dart';
import '../canvas/time_sleep_painter.dart';
import '../widgets/alarm/choice_day.dart';
import '../widgets/alarm/choice_voice.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_clock/circle_clock.dart';

class AddSleepTimeScreen extends GetWidget<SleepTimeController> {
  const AddSleepTimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

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
                child: Obx(
                  () => GestureDetector(
                    onTap: () => showTimeRangePicker(
                      context: context,
                      start: controller.timeSleep.value,
                      end: controller.timeWakeup.value,
                      onStartChange: (start) {
                        controller.setSleepTime(start);
                      },
                      onEndChange: (end) {
                        controller.setWakeupTime(end);
                      },
                      interval: const Duration(minutes: 1),
                      minDuration: const Duration(minutes: 1),
                      padding: Dimens.size32,
                      strokeWidth: Dimens.size20,
                      handlerRadius: Dimens.size14,
                      strokeColor: TingTingAppColor.clockBoxShadow,
                      handlerColor: TingTingAppColor.mainColor,
                      selectedColor: TingTingAppColor.mainColor,
                      backgroundColor: TingTingAppColor.appBackgroundColor,
                      ticks: Numbers.numberTwentyFour,
                      ticksColor: TingTingAppColor.whiteColor,
                      snap: true,
                      use24HourFormat: false,
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTitle(title: 'alarm_setting_to_bed'.tr, style: theme.button),
                                  CustomTitle(
                                    title: controller.timeSleep.value.format(context),
                                    style: theme.headline3,
                                  ),
                                  SizedBox(height: Dimens.size16),
                                  CustomTitle(
                                      title: controller.sleepingTime.value + 'alarm_setting_hours_of_sleep'.tr,
                                      style: theme.button),
                                  SizedBox(height: Dimens.size16),
                                  CustomTitle(
                                    title: controller.timeWakeup.value.format(context),
                                    style: theme.headline3,
                                  ),
                                  CustomTitle(title: 'alarm_setting_wake_up'.tr, style: theme.button),
                                ],
                              )),
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
              ),
              SizedBox(height: Dimens.size24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < controller.listDayOfToSleep.value.length; i++)
                      GetBuilder(
                        init: controller,
                        builder: (_) {
                          return ChoiceDay(
                            title: 'alarm_${controller.listDayOfToSleep.value.keys.elementAt(i)}'.tr,
                            press: () => controller.choiceDaySleep(
                              controller.listDayOfToSleep.value.keys.elementAt(i),
                            ),
                            isActive: controller.listDayOfToSleep.value.values.elementAt(i),
                          );
                        },
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
                    for (int i = 0; i < controller.listVoice.value.length; i++)
                      GetBuilder(
                        init: controller,
                        builder: (_) {
                          return ChoiceVoice(
                            title: 'alarm_voice_${controller.listVoice.value.keys.elementAt(i)}'.tr,
                            icon: AppIcon.iconVoice[i],
                            press: () => controller.choiceVoice(
                              controller.listVoice.value.keys.elementAt(i),
                            ),
                            isActive: controller.listVoice.value.values.elementAt(i),
                          );
                        },
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
                  onPressed: () async => await controller.addSleepTime(),
                  borderRadius: BorderRadius.circular(Dimens.size16),
                  child: GetBuilder(
                    init: controller,
                    builder: (_) {
                      return CustomTitle(
                        title: controller.isUpdate.value ? 'show_alarm_update'.tr : 'alarm_voice_create'.tr,
                        style: theme.button,
                      );
                    },
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
