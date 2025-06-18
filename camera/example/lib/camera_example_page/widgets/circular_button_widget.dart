import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onTap,
    this.size = 60,
    this.iconColor,
  });

  final IconData icon;
  final Color? iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.transparent,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    child: InkWell(
      onTap: onTap,
      // cameraController != null && cameraController.value.isInitialized ? onTakePictureButtonPressed : null,
      borderRadius: BorderRadius.circular(100),
      child: Ink(
        width: size,
        height: size,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(shape: BoxShape.circle, color: backgroundColor),
        child: Icon(icon, color: iconColor ?? Colors.white),
      ),
    ),
  );
}
