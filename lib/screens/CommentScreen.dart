import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final Function buildUI;
  CommentScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: Container(
        // TODO: REPLACE THIS CONTAINER WITH THE SCREEN
        color: Colors.teal,
      ),
    );
  }
}
