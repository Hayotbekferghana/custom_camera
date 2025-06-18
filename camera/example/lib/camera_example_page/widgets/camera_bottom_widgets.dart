import 'package:camera/camera.dart';
import 'package:camera_example/camera_example_page/custom_camera_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circular_button_widget.dart';

class CameraBottomWidgets extends StatelessWidget {
  const CameraBottomWidgets({
    super.key,
    required this.cameraOrientation,
    required this.controller,
    required this.changeCamera,
    required this.onTakePictureButtonPressed,
    required this.onSetFlashModeButtonPressed,
    required this.icon,
  });

  final CustomOrientation cameraOrientation;
  final CameraController? controller;
  final VoidCallback changeCamera;
  final VoidCallback onTakePictureButtonPressed;
  final VoidCallback onSetFlashModeButtonPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) => SafeArea(
        minimum: const EdgeInsets.only(bottom: 32),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              /// change camera
              AnimatedRotation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                turns: cameraOrientation.isPortrait
                    ? 0
                    : cameraOrientation.isRightLandScape
                        ? 1 / 4
                        : -(1 / 4),
                child: CircularIconButton(
                  iconColor: Colors.transparent,
                  icon: CupertinoIcons.arrow_2_circlepath,
                  backgroundColor: Colors.white,
                  onTap: changeCamera,
                ),
              ),

              /// take photo
              AnimatedRotation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                turns: cameraOrientation.isPortrait
                    ? 0
                    : cameraOrientation.isRightLandScape
                        ? 1 / 4
                        : -(1 / 4),
                child: CircularIconButton(
                  icon: Icons.camera_alt,
                  backgroundColor: Colors.blue,
                  onTap: controller != null && (controller?.value.isInitialized ?? false)
                      ? onTakePictureButtonPressed
                      : null,
                ),
              ),

              /// change flesh mode
              AnimatedRotation(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
                turns: cameraOrientation.isPortrait
                    ? 0
                    : cameraOrientation.isRightLandScape
                        ? 1 / 4
                        : -(1 / 4),
                child: CircularIconButton(
                  icon: icon,
                  backgroundColor: Colors.black.withValues(alpha: .6),
                  onTap: controller != null ? onSetFlashModeButtonPressed : null,
                ),
              ),
            ],
          ),
        ),
      );
}
