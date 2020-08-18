import 'package:flutter/material.dart';
import 'package:tiktok/widgets/VideoPlayer.dart';

// import './widgets/VideoPlayer.dart';
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
    final controller = PageController(
      initialPage: 1,
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            /*
            ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: colors[index],
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: VideoWidget(),
                );
              },
              itemCount: colors.length,
            ),
            */

            PageView(
              controller: controller,
              scrollDirection: Axis.vertical,
              children: colors.map((c) {
                return Container(
                  color: c,
                  child: VideoWidget(),
                );
              }).toList(),
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
      ),
    );
  }
}
