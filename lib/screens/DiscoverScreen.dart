import 'package:flutter/material.dart';

import '../widgets/discover/HorizontalCards.dart';
import '../widgets/discover/SearchBar.dart';
import '../widgets/discover/ImageSlider.dart';

/// This is where you can search other tiktoks.
class SearchScreen extends StatelessWidget {
  final Function buildUI;
  SearchScreen(this.buildUI);

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: SearchBar()),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Icon(Icons.photo_filter),
                  )
                ],
              ),
            ),
            ImageSlider(),
            HorizontalCards(),
            HorizontalCards(),
            HorizontalCards(),
            HorizontalCards(),
          ],
        ),
      ),
    );
  }
}
