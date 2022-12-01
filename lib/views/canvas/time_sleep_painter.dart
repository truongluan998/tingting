import 'dart:math';

import 'package:flutter/material.dart';

import '../../theme/ting_ting_app_color.dart';

class TimeSleepPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // setting the Center point coordinates
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);
    final double outerRadius = radius - 20;
    final double innerRadius = radius - 30;

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
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
