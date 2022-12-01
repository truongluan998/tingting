import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';

import '../../constants/dimens.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_title.dart';
import '../widgets/splash/balloons.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: size.width * Dimens.size0dot3,
            top: size.height * Dimens.size0dot2,
            child: Balloons(
              width: Dimens.size48,
              height: Dimens.size48,
              mainColor: TingTingAppColor.balloonColors,
              gradientColor: TingTingAppColor.whiteColor,
            ),
          ),
          Positioned(
            left: size.width * Dimens.size0dot15,
            top: size.height * Dimens.size0dot42,
            child: Balloons(
              width: Dimens.size64,
              height: Dimens.size64,
              mainColor: TingTingAppColor.balloonColors,
              gradientColor: TingTingAppColor.whiteColor,
            ),
          ),
          Positioned(
            right: size.width * Dimens.size0dot15,
            bottom: size.height * Dimens.size0dot39,
            child: Balloons(
              width: Dimens.size72,
              height: Dimens.size72,
              mainColor: TingTingAppColor.balloonColors,
              gradientColor: TingTingAppColor.whiteColor,
            ),
          ),
          Positioned(
            left: size.width * Dimens.size0dot07,
            bottom: size.height * Dimens.size0dot2,
            child: Balloons(
              width: Dimens.size104,
              height: Dimens.size104,
              mainColor: TingTingAppColor.balloonColors,
              gradientColor: TingTingAppColor.whiteColor,
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.size46),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height * Dimens.size0dot45),
                    CustomTitle(
                      title: 'splash_slogan'.tr,
                      style: theme.headline2,
                      isCenterTitle: true,
                    ),
                    const Spacer(),
                    AppButton(
                      onPressed: () => Get.offAllNamed("/alarm"),
                      borderRadius: BorderRadius.circular(Dimens.size36),
                      child: CustomTitle(
                        title: 'splash_next'.tr,
                        style: theme.button,
                      ),
                    ),
                    SizedBox(height: size.height * Dimens.size0dot07)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
