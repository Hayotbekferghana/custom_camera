import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/camera_bottom_widgets.dart';

part 'mixin/custom_camera_mixin.dart';

class CustomCameraPage extends StatefulWidget {
  const CustomCameraPage({super.key, this.args});

  final CustomCameraPageArgs? args;

  @override
  State<CustomCameraPage> createState() => _CustomCameraPageState();
}

class _CustomCameraPageState extends State<CustomCameraPage>
    with CustomCameraMixin, WidgetsBindingObserver, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _initCamera();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _initCamera() async {
    await getAvailableCameras();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _cameraPreviewWidget(),
          AnimatedPositioned(
            left: true ? 16 : null,
            duration: animationDuration,
            curve: Curves.easeIn,
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedRotation(
                    curve: Curves.easeIn,
                    duration: animationDuration,
                    turns: true
                        ? 0.0
                        : true
                            ? .25
                            : -.25,
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          CameraBottomWidgets(
            cameraOrientation: CustomOrientation.portrait,
            controller: controller,
            changeCamera: _changeCamera,
            onTakePictureButtonPressed: () => onTakePictureButtonPressed(CustomOrientation.portrait),
            onSetFlashModeButtonPressed: onSetFlashModeButtonPressed,
            icon: _getFlashModeIconType,
          ),
        ],
      )
      // CustomOrientationBuilder(
      //     builder: (context, orientation) {
      //       if (controller == null || !(controller?.value.isInitialized ?? false)) {
      //         return const Center(child: CircularProgressIndicator());
      //       } else {
      //         final mediaSize = MediaQuery.of(context).size;
      //         final scale = 1 / ((controller?.value.aspectRatio ?? 0) * mediaSize.aspectRatio);
      //         return Stack(
      //           children: <Widget>[
      //             /// CAMERA
      //             // !true && Platform.isIOS
      //             //     ? Transform.rotate(
      //             //       angle: pi / 2,
      //             //       child: ClipRRect(
      //             //         clipper: _MediaSizeClipper(mediaSize),
      //             //         child: Transform.scale(
      //             //           scale: scale,
      //             //           alignment: Alignment.topCenter,
      //             //           child: _cameraPreviewWidget(),
      //             //         ),
      //             //       ),
      //             //     )
      //             //     :
      //             ClipRRect(
      //               clipper: _MediaSizeClipper(mediaSize),
      //               child: Transform.scale(scale: scale, alignment: Alignment.topCenter, child: _cameraPreviewWidget()),
      //             ),
      //
      //             /// BACK BUTTON
      //             AnimatedPositioned(
      //               left: true ? 16 : null,
      //               right: orientation.isPortrait ? null : 16,
      //               duration: animationDuration,
      //               curve: Curves.easeIn,
      //               child: SafeArea(
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     AnimatedRotation(
      //                       curve: Curves.easeIn,
      //                       duration: animationDuration,
      //                       turns: orientation.isPortrait
      //                           ? 0.0
      //                           : orientation.isRightLandScape
      //                               ? .25
      //                               : -.25,
      //                       child: BackButton(
      //                         color: Colors.white,
      //                         onPressed: () {
      //                           if (Navigator.of(context).canPop()) {
      //                             Navigator.of(context).pop();
      //                           }
      //                         },
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //
      //             /// ROW ICONS
      //             CameraBottomWidgets(
      //               cameraOrientation: orientation,
      //               controller: controller,
      //               changeCamera: _changeCamera,
      //               onTakePictureButtonPressed: () => onTakePictureButtonPressed(orientation),
      //               onSetFlashModeButtonPressed: onSetFlashModeButtonPressed,
      //               icon: _getFlashModeIconType,
      //             ),
      //           ],
      //         );
      //       }
      //     },
      //   ),
      );

  Widget _cameraPreviewWidget() {
    final CameraController? cameraController = controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text(
        'Tap a camera',
        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w900),
      );
    } else {
      if (Platform.isAndroid) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..scale(-1.0, 1, 1),
          child: CameraPreview(controller!),
        );
      }
      return CameraPreview(controller!);
    }
  }
}

class CustomCameraPageArgs {
  const CustomCameraPageArgs({
    required this.title,
    required this.shapeImagePath,
    this.shapeType = CameraShapeType.none,
    this.openFrontCamera = false,
  });

  final String shapeImagePath;
  final String title;
  final CameraShapeType shapeType;
  final bool openFrontCamera;
}

/// ======= Custom Orientation Builder Start =======
class CustomOrientationBuilder extends StatefulWidget {
  const CustomOrientationBuilder({required this.builder, super.key});

  final Widget Function(BuildContext, CustomOrientation) builder;

  @override
  State<CustomOrientationBuilder> createState() => _CustomOrientationBuilderState();
}

class _CustomOrientationBuilderState extends State<CustomOrientationBuilder> {
  // late StreamSubscription<AccelerometerEvent> accelerometerSubscription;
  CustomOrientation cameraOrientation = CustomOrientation.portrait;

  @override
  void initState() {
    super.initState();
    // orientation();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, cameraOrientation);

  // void orientation() {
  //   try {
  //     accelerometerSubscription = accelerometerEventStream(samplingPeriod: const Duration(seconds: 1)).listen(
  //       (event) {
  //         setState(() {
  //           if (event.z < -8.0) {
  //             cameraOrientation = CustomOrientation.portrait;
  //           } else if (event.x > 5.0) {
  //             cameraOrientation = CustomOrientation.rightLandScape;
  //           } else if (event.x < -5.0) {
  //             cameraOrientation = CustomOrientation.leftLandScape;
  //           } else {
  //             cameraOrientation = CustomOrientation.portrait;
  //           }
  //         });
  //       },
  //       onError: (Object e) {
  //         debugPrint('Error: $e');
  //       },
  //       cancelOnError: true,
  //     );
  //   } on PlatformException catch (e) {
  //     debugPrint('Error: $e');
  //   }
  // }

  @override
  void dispose() {
    super.dispose();

    /// do not forget to dispose or cancel or even remove any listeners or controllers or streams.
    // accelerometerSubscription.cancel();
  }
}

enum CustomOrientation {
  portrait,
  leftLandScape,
  rightLandScape;

  bool get isPortrait => this == CustomOrientation.portrait;

  bool get isLeftLandScape => this == CustomOrientation.leftLandScape;

  bool get isRightLandScape => this == CustomOrientation.rightLandScape;
}

/// ======= Custom Orientation Builder End =======

class _MediaSizeClipper extends CustomClipper<RRect> {
  const _MediaSizeClipper(this.mediaSize);

  final Size mediaSize;

  @override
  RRect getClip(Size size) => RRect.fromLTRBR(0, 0, mediaSize.width, mediaSize.height, Radius.zero);

  @override
  bool shouldReclip(covariant CustomClipper<RRect> oldClipper) => true;
}

const Duration animationDuration = Duration(milliseconds: 300);

enum CameraShapeType {
  none,
  document,
  face,
  documentAndFace;

  bool get isNone => this == CameraShapeType.none;

  bool get isDocument => this == CameraShapeType.document;

  bool get isFace => this == CameraShapeType.face;

  bool get isDocumentAndFace => this == CameraShapeType.documentAndFace;
}

class CustomCameraImageResult {
  const CustomCameraImageResult({this.orientation = CustomOrientation.portrait, this.imageFile});

  final CustomOrientation orientation;
  final XFile? imageFile;
}
