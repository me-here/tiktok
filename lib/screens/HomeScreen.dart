import 'package:flutter/material.dart';
import '../widgets/TopBar.dart';
import '../widgets/Description.dart';
import '../widgets/ShareIcons.dart';
import '../widgets/BottomNavigation.dart';
import '../widgets/VideoPlayer.dart';

/// This is the home page with the videos, descriptions, action buttons, etc.
class HomeScreen extends StatelessWidget {
  final Function buildUI;
  HomeScreen(this.buildUI);

  final List<Color> colors = [Colors.green, Colors.blue, Colors.orange];

  final controller = PageController(
    initialPage: 0,
  );

  Widget get homePageOverlay {
    return Column(children: [
      TopBar(),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Description(
                username: 'firestart',
                tags: [
                  "foryoupage",
                  "fyp",
                  "sampleDescription",
                  "cats",
                  "fyp",
                  "sampleDescription"
                ],
              ),
            ),
            ShareIcons(),
          ],
        ),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: homePageOverlay,
      backLayer: _backgroundVideos(controller),
    );
  }

  PageView _backgroundVideos(PageController controller) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: colors.map((c) {
        return Container(
          color: c,
          child: VideoWidget(),
        );
      }).toList(),
    );
  }
}
