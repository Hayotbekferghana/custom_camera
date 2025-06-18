import 'package:flutter/material.dart';

class FaceOvalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint overlayPaint =
        Paint()
          ..color = Colors.black.withValues(alpha:0.7)
          ..style = PaintingStyle.fill;

    final Paint borderPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 4;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final widthTop = size.width * 1.2; // yuqori qismi keng
    final widthBottom = size.width * 1.1; // pastki qismi tor
    final height = size.height * 0.28; // balandlik

    final Path path =
        Path()
          // Boshlanish yuqori markaz
          ..moveTo(centerX, centerY - height)
          // O'ng tomondan pastga tushish
          ..cubicTo(
            centerX + widthTop / 2,
            centerY - height, // yuqori o'ng control point
            centerX + widthBottom / 2,
            centerY + height, // pastki o'ng control point
            centerX,
            centerY + height, // pastki markaz
          )
          // Chap tomondan yuqoriga ko'tarilish
          ..cubicTo(
            centerX - widthBottom / 2,
            centerY + height, // pastki chap control point
            centerX - widthTop / 2,
            centerY - height, // yuqori chap control point
            centerX,
            centerY - height, // yuqori markaz (boshlash nuqtasi)
          )
          ..close();

    // Qoraytirilgan overlay
    final Path overlayPath = Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      path,
    );

    // Qoraytirilgan hudud
    canvas
      ..drawPath(overlayPath, overlayPaint)
      // Oq chiziq
      ..drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
