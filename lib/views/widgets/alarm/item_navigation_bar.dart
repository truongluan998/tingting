import 'package:flutter/material.dart';

import '../../../constants/dimens.dart';
import '../../../theme/ting_ting_app_color.dart';

class ItemNavigationBar extends StatelessWidget {
  const ItemNavigationBar({
    Key? key,
    required this.index,
    required this.matchIndex,
    required this.icon,
  }) : super(key: key);

  final int index;
  final int matchIndex;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * Dimens.size0dot25,
      padding: EdgeInsets.symmetric(vertical: Dimens.size8),
      decoration: BoxDecoration(
        color: index == matchIndex ? Colors.white : TingTingAppColor.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimens.size12)),
      ),
      child: Icon(icon),
    );
  }
}
