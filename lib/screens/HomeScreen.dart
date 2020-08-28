import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/home_screen/TopBar.dart';
import '../widgets/home_screen/Description.dart';
import '../widgets/home_screen/ShareIcons.dart';
import '../widgets/home_screen/VideoPlayer.dart';
import '../providers/VideoStatus.dart';

import 'dart:core';

import 'package:firebase_database/firebase_database.dart';

/// This is the home page with the videos, descriptions, action buttons, etc.
class HomeScreen extends StatefulWidget {
  final Function buildUI;

  HomeScreen(this.buildUI);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  List<Map<String, dynamic>> videos;

  @override
  void initState() {
    super.initState();

    final ref = FirebaseDatabase.instance.reference().child("videos");
    ref.once().then((DataSnapshot snap) {
      print("OUTSIDE");
      videos = snap.value.map((e) {
        print("INSIDE");
        return e;
      }).toList();
      print(videos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => VideoStatus(),
      child: widget.buildUI(
        frontLayer: homePageOverlay,
        backLayer: _backgroundVideos(controller),
      ),
    );
  }

  PageView _backgroundVideos(PageController controller) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: ["hello"].map((c) {
        return Container(
          color: Colors.black,
          child: VideoWidget('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
        );
      }).toList(),
    );
  }
}
