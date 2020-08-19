import 'package:flutter/material.dart';

import './widgets/VideoPlayer.dart';
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
  final List<Color> colors = [Colors.green, Colors.blue, Colors.orange];

  PageView _backgroundVideos(PageController controller) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: colors.map((c) {
        // TODO: Change to vids map
        return Container(
          color: c,
          child: VideoWidget(),
        );
      }).toList(),
    );
  }

  static Column _uiOverlay = Column(
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
  );

  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 0,
    );

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _backgroundVideos(controller),
            _uiOverlay,
          ],
        ),
      ),
    );
  }
}
