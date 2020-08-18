import 'package:flutter/material.dart';

import './widgets/TopBar.dart';
import './widgets/BottomNavigation.dart';
import './widgets/Description.dart';
import './widgets/ShareIcons.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TikTok",
      home: TikTok(),
    ),
  );
}

class TikTok extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Column(
            children: [
              TopBar(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Description(),
                    ),
                    ShareIcons(),
                  ],
                ),
              ),
              BottomNavigation()
            ],
          ),
        ],
      ),
    );
  }
}
