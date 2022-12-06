import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../custom_title.dart';

class ShowTimeSleep extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;

  const ShowTimeSleep({
    Key? key,
    required this.title,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          size: Dimens.size32,
        ),
        SizedBox(width: Dimens.size16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTitle(title: title, style: theme.button),
            CustomTitle(
              title: content,
              style: theme.headline3,
            )
          ],
        )
      ],
    );
  }
}
