import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;
  final bool isCenterTitle;
  final int? maxLine;

  const CustomTitle({
    Key? key,
    required this.title,
    required this.style,
    this.isCenterTitle = false,
    this.maxLine = 2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: isCenterTitle ? TextAlign.center : TextAlign.start,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
