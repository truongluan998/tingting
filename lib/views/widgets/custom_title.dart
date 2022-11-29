import 'package:flutter/material.dart';

import '../../constants/dimens.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final bool isCenterTitle;

  const CustomTitle({
    Key? key,
    required this.title,
    required this.style,
    this.isCenterTitle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: isCenterTitle ? TextAlign.center : TextAlign.start,
      maxLines: Numbers.numberTwo,
      overflow: TextOverflow.ellipsis,
    );
  }
}
