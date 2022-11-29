import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../theme/ting_ting_app_color.dart';
import '../custom_title.dart';

class ShowTime extends StatelessWidget {
  final String title;
  const ShowTime({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimens.size16),
      height: 60,
      width: size.width * 0.35,
      decoration: BoxDecoration(
        color: TingTingAppColor.clockGradientColorTwo,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: CustomTitle(
          title: title,
          style: theme.button,
        ),
      ),
    );
  }
}
