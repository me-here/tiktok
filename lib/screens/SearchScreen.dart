import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final Function buildUI;
  SearchScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: Container(
        // TODO: REPLACE THIS CONTAINER WITH THE SCREEN
        color: Colors.green,
      ),
    );
  }
}
