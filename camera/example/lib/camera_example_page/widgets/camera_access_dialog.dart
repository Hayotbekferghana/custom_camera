// import 'package:app_settings/app_settings.dart';
// import 'package:flutter/material.dart';

// class CameraAccessDeniedDialog extends StatelessWidget {
//   const CameraAccessDeniedDialog({super.key});

//   @override
//   Widget build(BuildContext context) => SimpleDialog(
//         contentPadding: const EdgeInsets.all(12),
//         title: const Text('Camera Access'),
//         children: [
//           const Text('We need access to your camera'),
//           const SizedBox(height: 16),
//           Row(
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     Navigator.of(context).pop();
//                     await AppSettings.openAppSettings();
//                   },
//                   child: const Text('yes'),
//                 ),
//               ),
//               const SizedBox(
//                 width: 20,
//               ),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     Navigator.of(context)
//                       ..pop()
//                       ..pop();
//                   },
//                   child: const Text('no'),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       );
// }
