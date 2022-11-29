import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';
import 'package:tingting/views/widgets/custom_title.dart';

import '../../constants/dimens.dart';
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
          padding:  EdgeInsets.symmetric(vertical: Dimens.size32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
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
                    ],
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
