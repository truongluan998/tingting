import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';

class CustomVerticalDivider extends StatelessWidget {
  final double height;
  final double paddingTop;
  final double paddingLeft;
  final double paddingRight;
  final double paddingBottom;
  const CustomVerticalDivider({
    Key? key,
    required this.height,
    this.paddingTop = 0,
    this.paddingLeft = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingTop,
          left: paddingLeft,
          right: paddingRight,
          bottom: paddingBottom,
        ),
        child: VerticalDivider(thickness: Dimens.size1dot5),
      ),
    );
  }
}
