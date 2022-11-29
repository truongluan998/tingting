import 'package:flutter/material.dart';

class Balloons extends StatelessWidget {
  final double width;
  final double height;
  final Color mainColor;
  final Color gradientColor;
  const Balloons({
    Key? key,
    required this.width,
    required this.height,
    required this.mainColor,
    required this.gradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            colors: [
              mainColor,
              gradientColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
