import 'package:flutter/material.dart';
import 'package:tingting/constants/dimens.dart';

class AppButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient = const LinearGradient(
        colors: [
          Color(0xFFDCEEFB),
          Color(0xFFECB2EE),
          Color(0xFFFECE89),
        ],
        stops: [0.0, 0.7, 1.0],
        tileMode: TileMode.clamp),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(Dimens.size0);
    return Material(
      elevation: Dimens.size4,
      borderRadius: borderRadius,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? Dimens.size64,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
