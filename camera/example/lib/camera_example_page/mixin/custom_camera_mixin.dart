part of '../custom_camera_page.dart';

mixin CustomCameraMixin on State<CustomCameraPage> {
  CameraController? controller;
  late int currentCameraIndex;
  late List<CameraDescription> cameras;

  XFile? imageFile;
  bool enableAudio = true;

  Future<void> getAvailableCameras({bool openFrontCamera = false}) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        currentCameraIndex = 0;
        CameraDescription frontCamera = cameras.first;
        // Select the front camera.
        if (openFrontCamera) {
          frontCamera = cameras.firstWhere(
            (camera) => camera.lensDirection == CameraLensDirection.front,
            orElse: () => cameras.first,
          );
        }
        try {
          await onNewCameraSelected(openFrontCamera ? frontCamera : cameras[currentCameraIndex]);
        } on CameraException catch (e) {
          _showCameraException(e);
        }
      }
    } on CameraException catch (e) {
      debugPrint('Error: ${e.code}\nError Message: ${e.description}');
    }
  }

  void _changeCamera() {
    setState(() {
      if (currentCameraIndex + 1 < cameras.length) {
        // ++currentCameraIndex;
      } else {
        currentCameraIndex = 0;
      }
      onNewCameraSelected(cameras[currentCameraIndex]);
    });
  }

  void showInSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      return controller!.setDescription(cameraDescription);
    } else {
      return _initializeCameraController(cameraDescription);
    }
  }

  Future<void> _initializeCameraController(CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isIOS ? ImageFormatGroup.bgra8888 : ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        showInSnackBar('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
    } on CameraException {
      // switch (e.code) {
      //   case 'CameraAccessDenied' || 'CameraAccessDeniedWithoutPrompt':
      //     if (mounted) {
      //       await showDialog<void>(
      //         barrierDismissible: false,
      //         context: context,
      //         builder: (_) => const CameraAccessDeniedDialog(),
      //       );
      //     }
      //     showInSnackBar('You have denied camera access.');
      //   case 'CameraAccessRestricted':
      //     // iOS only
      //     showInSnackBar('Camera access is restricted.');
      //   default:
      //     _showCameraException(e);
      // }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> onTakePictureButtonPressed(CustomOrientation orientation) async {
    final CustomOrientation orientation0 = orientation;
    debugPrint('asdfasdfasdf');
    await takePicture().then((file) async {
      debugPrint('asdfasdfasdf asdf $file');
      if (mounted) {
        imageFile = file;

        // if (widget.args.openFrontCamera) {
        //   debugPrint('fixCapturedFrontalImage');
        //   // imageFile = await fixCapturedFrontalImage(file!);
        // }
        // if (!orientation.isPortrait && imageFile != null) {
        //   imageFile = await rotateOrientationImage(File(imageFile!.path), orientation);
        //   if (imageFile != null) {
        //     orientation0 = CustomOrientation.portrait;
        //   }
        // }
        setState(() {});
        if (mounted) {
          debugPrint('custom orientation: ${orientation0.name}');
          // Navigator.of(context).pop(CustomCameraImageResult(orientation: orientation0, imageFile: imageFile));
        }
      }
    });
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      showInSnackBar('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    debugPrint('Error: ${e.code}${e.description == null ? '' : '\nError Message: ${e.description}'}');
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  IconData get _getFlashModeIconType {
    IconData icon = Icons.flash_off;
    switch (controller?.value.flashMode) {
      case FlashMode.off:
        icon = Icons.flash_off;
      case FlashMode.auto:
        icon = Icons.flash_auto;
      case FlashMode.torch:
        icon = Icons.flash_on;
      default:
        icon = Icons.flash_off;
    }
    return icon;
  }

  Future<void> onSetFlashModeButtonPressed() async {
    if (controller == null) {
      return;
    }

    FlashMode flashMode = controller?.value.flashMode ?? FlashMode.off;

    try {
      switch (flashMode) {
        case (FlashMode.off):
          flashMode = FlashMode.torch;
        case (FlashMode.torch):
          flashMode = FlashMode.auto;
        case (FlashMode.auto):
          flashMode = FlashMode.off;
        default:
          flashMode = FlashMode.off;
      }

      await controller!.setFlashMode(flashMode);
    } on CameraException catch (e) {
      _showCameraException(e);
      rethrow;
    }

    setState(() {});
  }
}

extension FlashModeX on FlashMode {
  bool get isFlashModeOn => this == FlashMode.always || this == FlashMode.torch;

  bool get isFlashModeAuto => this == FlashMode.auto;

  bool get isFlashModeOff => this == FlashMode.off;
}
