import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../theme/ting_ting_app_color.dart';
import '../custom_title.dart';

class ChoiceVoice extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool isActive;

  const ChoiceVoice({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          top: Dimens.size8,
          left: Dimens.size8,
          right: Dimens.size8,
        ),
        height: Dimens.size56,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActive ? TingTingAppColor.mainColor : TingTingAppColor.clockGradientColorTwo,
          borderRadius: BorderRadius.circular(Dimens.size16),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.size8),
              child: Icon(
                icon,
                size: Dimens.size32,
                color: isActive ? TingTingAppColor.whiteColor : TingTingAppColor.mainColor,
              ),
            ),
            CustomTitle(
              title: title,
              style: theme.button!.copyWith(
                color: isActive ? TingTingAppColor.whiteColor : TingTingAppColor.mainColor,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.size8),
              child: Icon(
                Icons.navigate_next,
                color: isActive ? TingTingAppColor.whiteColor : TingTingAppColor.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
