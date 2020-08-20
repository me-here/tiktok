import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final Function buildUI;
  ProfileScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: Container(
        // TODO: REPLACE THIS CONTAINER WITH THE SCREEN
        color: Colors.blueGrey,
      ),
    );
  }
}
