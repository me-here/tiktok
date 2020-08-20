import 'package:flutter/material.dart';

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
                  Expanded(
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Icon(Icons.photo_filter),
                  )
                ],
              ),
            ),
            Container(
              height: 200,
              color: Colors.red,
            ),
            Container(
              height: 200,
              color: Colors.green,
            ),
            Container(
              height: 200,
              color: Colors.yellow,
            ),
            Container(
              height: 200,
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
