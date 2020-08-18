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
  List<Color> colors = [Colors.green, Colors.blue, Colors.orange];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // START: VIDEO PLAYER
          // Container(
          //   color: Colors.black,
          // ),
          // END: VIDEO PLAYER
          ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: colors[index],
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              );
            },
            itemCount: colors.length,
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
