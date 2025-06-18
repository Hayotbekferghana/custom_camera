import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewImagePage extends StatelessWidget {
  const PreviewImagePage({super.key, required this.file});

  final XFile file;

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: Image.file(File(file.path))));
}
