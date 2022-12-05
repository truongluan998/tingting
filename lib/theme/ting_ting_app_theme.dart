import 'package:flutter/material.dart';
import 'package:tingting/theme/ting_ting_app_color.dart';

import '../constants/dimens.dart';

class TingTingAppTheme {
  static ThemeData buildTheme() => ThemeData(
        scaffoldBackgroundColor: TingTingAppColor.appBackgroundColor,
        appBarTheme: const AppBarTheme(
          color: TingTingAppColor.appBackgroundColor,
          elevation: 0
        ),
        fontFamily: 'JosefinSans',
        primaryColor: TingTingAppColor.mainColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: Dimens.size42,
            color: TingTingAppColor.textBlackColor,
            fontWeight: FontWeight.w400,
            letterSpacing: -2,
          ),
          headline2: TextStyle(
            fontSize: Dimens.size36,
            color: TingTingAppColor.textBlackColor,
            fontWeight: FontWeight.w400,
          ),
          headline3: TextStyle(
            fontSize: Dimens.size28,
            color: TingTingAppColor.textBlackColor,
            fontWeight: FontWeight.w400,
          ),
          subtitle1: TextStyle(
            fontSize: Dimens.size26,
            color: TingTingAppColor.clockGradientColorTwo,
            fontWeight: FontWeight.bold,
          ),
          subtitle2: TextStyle(
            fontSize: Dimens.size22,
            color: TingTingAppColor.clockBoxShadow,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            fontSize: Dimens.size22,
            color: TingTingAppColor.textBlackColor,
            fontWeight: FontWeight.w400,
          ),
          button: TextStyle(
            fontSize: Dimens.size20,
            color: TingTingAppColor.textBlackColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
}
