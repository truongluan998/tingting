import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/ting_ting_app_color.dart';

class ClockPainter extends CustomPainter {
  final DateTime now;

  ClockPainter({required this.now});

  @override
  void paint(Canvas canvas, Size size) {
    double secRad = ((pi / 2) - (pi / 30) * now.second) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * now.minute) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * now.hour) % (2 * pi);

    // setting the Center point coordinates
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);
    final double outerRadius = radius - 20;
    final double innerRadius = radius - 30;

    /* Setting the Time coordinates */
    final secHeight = radius / 1.25;
    final minHeight = radius / 1.25 - 20;
    final hoursHeight = radius / 1.25 - 40;

    final seconds = Offset(centerX + secHeight * cos(secRad), centerY - secHeight * sin(secRad));
    final minutes = Offset(centerX + cos(minRad) * minHeight, centerY - sin(minRad) * minHeight);
    final hours = Offset(centerX + cos(hourRad) * hoursHeight, centerY - sin(hourRad) * hoursHeight);

    // Setting the Fillbrush paint
    // final fillBrush = Paint()
    //   ..color = Colors.black
    //   ..strokeCap = StrokeCap.round;

    // var outlineBrush = Paint()
    //  ..color = Color(0xFFEAECFF)
    //  ..style = PaintingStyle.stroke
    //  ..style = PaintingStyle.stroke
    //  ..strokeWidth = 16;

    final centerDotBrush = Paint()..color = TingTingAppColor.mainColor;

    /* Setting the hands brush */

    final secHandBrush = Paint()
      ..color = TingTingAppColor.balloonColors
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    final minHandBrush = Paint()
      ..color = TingTingAppColor.clockBoxShadow
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;

    final hourHandBrush = Paint()
      ..color = TingTingAppColor.mainColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5
      ..strokeJoin = StrokeJoin.round;

    // canvas.drawCircle(center, radius - 40, fillBrush);
    // canvas.drawCircle(center, radius - 40, outlineBrush);

    final hourDashPaint = Paint()
      ..color = TingTingAppColor.whiteColor
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 360; i += 30) {
      final x1 = centerX - outerRadius * cos(i * pi / 180);
      final y1 = centerX - outerRadius * sin(i * pi / 180);

      final x2 = centerX - innerRadius * cos(i * pi / 180);
      final y2 = centerX - innerRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
    }

    final minuteDashPaint = Paint()
      ..color = TingTingAppColor.whiteColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < 360; i += 6) {
      final x1 = centerX - outerRadius * cos(i * pi / 180);
      final y1 = centerX - outerRadius * sin(i * pi / 180);

      final x2 = centerX - innerRadius * cos(i * pi / 180);
      final y2 = centerX - innerRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), minuteDashPaint);
    }

    // drawing the sec hand
    canvas.drawLine(center, seconds, secHandBrush);
    canvas.drawLine(center, minutes, minHandBrush);
    canvas.drawLine(center, hours, hourHandBrush);

    canvas.drawCircle(center, 5, centerDotBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
