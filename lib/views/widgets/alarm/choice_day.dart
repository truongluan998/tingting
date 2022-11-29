import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../theme/ting_ting_app_color.dart';
import '../custom_title.dart';

class ChoiceDay extends StatelessWidget {
  const ChoiceDay({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.size8),
        margin: EdgeInsets.only(left: Dimens.size8),
        height: Dimens.size64,
        width: Dimens.size56,
        decoration: BoxDecoration(
          color: TingTingAppColor.clockGradientColorTwo,
          borderRadius: BorderRadius.circular(Dimens.size32),
        ),
        child: Center(
          child: CustomTitle(
            title: title,
            style: theme.button,
          ),
        ),
      ),
    );
  }
}
