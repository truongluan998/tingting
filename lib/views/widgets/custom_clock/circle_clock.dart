import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../theme/ting_ting_app_color.dart';

class CircleClock extends StatelessWidget {
  final double? width;
  final double? height;
  final LinearGradient gradient;
  final double offsetOne;
  final double offsetTwo;
  final double offsetThree;
  final double offsetFour;
  final bool isBoxConstraints;
  const CircleClock({
    Key? key,
    this.width,
    this.height,
    required this.gradient,
    required this.offsetOne,
    required this.offsetTwo,
    required this.offsetThree,
    required this.offsetFour,
    this.isBoxConstraints = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: isBoxConstraints ? const BoxConstraints.expand() : null,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: TingTingAppColor.clockBoxShadow.withOpacity(Dimens.opa0Dot2),
            blurRadius: Dimens.size32,
            offset: Offset(offsetOne, offsetTwo),
          ),
          BoxShadow(
            color: TingTingAppColor.whiteColor,
            blurRadius: Dimens.size32,
            offset: Offset(offsetThree, offsetFour),
          )
        ],
      ),
    );
  }
}
