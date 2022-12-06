import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/constants/dimens.dart';
import 'package:tingting/controllers/step_clock_controller.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';

import '../../../utils/convert_time.dart';
import '../../../utils/enum.dart';
import '../../canvas/clock_painter.dart';
import '../alarm/show_time.dart';
import 'circle_clock.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    StepClockController stepClockController;

    stepClockController =
        Get.isRegistered<StepClockController>() ? Get.find<StepClockController>() : Get.put(StepClockController());

    return Center(
      child: Column(
        children: [
          SizedBox(
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
                GetBuilder<StepClockController>(
                  init: stepClockController,
                  builder: (_) => Container(
                    constraints: const BoxConstraints.expand(),
                    child: CustomPaint(
                      painter: ClockPainter(now: stepClockController.timeNow.value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GetBuilder<StepClockController>(
            init: stepClockController,
            builder: (_) => Row(
              children: [
                ShowTime(title: ConvertTime.convertDateTime(stepClockController.timeNow.value, ConvertTimeType.hms)),
                const Spacer(),
                ShowTime(title: ConvertTime.convertDateTime(stepClockController.timeNow.value, ConvertTimeType.dmy)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
