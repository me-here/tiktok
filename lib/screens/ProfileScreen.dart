import 'package:flutter/material.dart';

/// This is where you see your profile.
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
