import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  final Function buildUI;
  AddScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: Container(
        // TODO: REPLACE THIS CONTAINER WITH THE SCREEN
        color: Colors.orange,
      ),
    );
  }
}
