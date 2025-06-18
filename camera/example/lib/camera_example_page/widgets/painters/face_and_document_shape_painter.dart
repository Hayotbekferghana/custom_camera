import 'package:flutter/material.dart';

class FaceAndDocumentShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define paint styles
    final Paint borderPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3.0;

    final Paint backgroundPaint =
        Paint()
          ..color = Colors.black.withValues(alpha:0.7)
          ..style = PaintingStyle.fill;

    // Center of screen
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Dynamic sizing based on screen dimensions
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    // Rectangle dimensions (proportional to screen size)
    final double rectWidth = screenWidth * 0.55;
    final double rectHeight = screenHeight * 0.4;
    final double rectYOffset = screenHeight * 0.17;

    // Oval dimensions (proportional to screen size)
    final double ovalWidth = screenWidth * 0.7; // Wider horizontally
    final double ovalHeight = screenHeight * 0.27; // Shorter vertically
    final double ovalYOffset = screenHeight * 0.2;

    // Rectangle overlay (top)
    final Rect rectangleOverlay = Rect.fromCenter(
      center: Offset(centerX, centerY - rectYOffset),
      width: rectWidth,
      height: rectHeight,
    );

    // Create rounded rectangle path for top shape
    final RRect roundedRect = RRect.fromRectAndRadius(
      rectangleOverlay,
      const Radius.circular(12), // rectWidth * 0.1 Dynamic corner radius
    );

    // Create oval for bottom shape (horizontal orientation)
    final Rect ovalBounds = Rect.fromCenter(
      center: Offset(centerX, centerY + ovalYOffset),
      width: ovalWidth,
      height: ovalHeight,
    );

    // Create a path for the entire screen
    final Path backgroundPath = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Create a path for the cutouts
    final Path cutoutPath =
        Path()
          ..addRRect(roundedRect)
          ..addOval(ovalBounds);

    // Use difference to cut out the shapes from the background
    final Path finalPath = Path.combine(PathOperation.difference, backgroundPath, cutoutPath);

    // Draw the semi-transparent background with cutouts
    canvas
      ..drawPath(finalPath, backgroundPaint)
      // Draw borders around the cutout shapes
      ..drawRRect(roundedRect, borderPaint)
      ..drawOval(ovalBounds, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
