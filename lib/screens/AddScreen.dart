import 'package:flutter/material.dart';
import 'package:tiktok/widgets/Camera.dart';

/// This is where you add your pictures.
class AddScreen extends StatelessWidget {
  final Function buildUI;
  AddScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(frontLayer: CameraWidget());
  }
}
