import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/constants/dimens.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';

import '../../../controllers/clock_controller.dart';
import '../../../uitls/convert_time.dart';
import '../../../uitls/enum.dart';
import '../../canvas/clock_painter.dart';
import '../alarm/show_time.dart';
import 'circle_clock.dart';

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final clockController = Get.find<ClockController>();

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
                GetBuilder<ClockController>(
                  init: clockController,
                  builder: (_) => Container(
                    constraints: const BoxConstraints.expand(),
                    child: CustomPaint(
                      painter: ClockPainter(now: clockController.timeNow.value),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GetBuilder<ClockController>(
            init: clockController,
            builder: (_) => Row(
              children: [
                ShowTime(title: ConvertTime.convertDateTime(clockController.timeNow.value, ConvertTimeType.hms)),
                const Spacer(),
                ShowTime(title: ConvertTime.convertDateTime(clockController.timeNow.value, ConvertTimeType.dmy)),
              ],
            ),
          )
        ],
      ),
    );
  }
}