import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';

import '../constants/dimens.dart';

class AppUtils {
  static SnackbarController showCusTomSnackBar(String? header, String? title) {
    return Get.snackbar(
      header ?? DimenString.emptyText,
      title ?? DimenString.emptyText,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: TingTingAppColor.smallClockGradientColorOne,
      borderRadius: Dimens.size20,
      margin: EdgeInsets.all(Dimens.size32),
      colorText: TingTingAppColor.textBlackColor,
      duration: const Duration(milliseconds: 1200),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
