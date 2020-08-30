import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:video_player/video_player.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class VideoGrids extends StatefulWidget {
  final tabController;
  VideoGrids(this.tabController);

  @override
  _VideoGridsState createState() => _VideoGridsState(this.tabController);
}

class _VideoGridsState extends State<VideoGrids> {
  final tabController;
  _VideoGridsState(this.tabController);

  List<String> userVideos = [
    // 'https://firebasestorage.googleapis.com/v0/b/tiktok-25d92.appspot.com/o/videos%2F1598676594489.mp4?alt=media&token=dbc46ca5-0370-4caf-a2af-55ea6c3f19bd',
    // 'https://firebasestorage.googleapis.com/v0/b/tiktok-25d92.appspot.com/o/videos%2F1598676594489.mp4?alt=media&token=dbc46ca5-0370-4caf-a2af-55ea6c3f19bd',
    // 'https://firebasestorage.googleapis.com/v0/b/tiktok-25d92.appspot.com/o/videos%2F1598676594489.mp4?alt=media&token=dbc46ca5-0370-4caf-a2af-55ea6c3f19bd',
  ];

  @override
  void initState() {
    super.initState();
    updateProfileImages();
  }

  Future<void> updateProfileImages() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    final posts =
        await FirebaseDatabase.instance.reference().child('users/$uid').once();

    Map<String, String>.from(posts.value).forEach((key, value) {
      userVideos.add(value);
    });

    setState(() {});
  }

  List<VideoPlayerController> controllers = [];

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> userLikedVideos = [];

    List<String> userPrivateVideos = [];

    //Calculates the height of the gridview with all elements
    double gridVidAspectRatio = 27 / 35; //vidWidth/vidHeight

    final userVideoGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userVideos.length, (index) {
          final vidController = VideoPlayerController.network(
            userVideos[index],
          );
          controllers.add(vidController);
          vidController.initialize();
          return VideoPlayer(vidController);
        }),
      ),
    );

    final userVideoLikedGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userLikedVideos.length, (index) {
          return Container(
            child: Image.network(
              userLikedVideos[index],
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );

    final userVideoPrivatesGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userPrivateVideos.length, (index) {
          return Container(
            child: Image.network(
              userPrivateVideos[index],
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );

    final gridsWithCorrespondingTabs = SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          userVideoGrid,
          userVideoLikedGrid,
          userVideoPrivatesGrid,
        ],
      ),
    );

    return gridsWithCorrespondingTabs;
  }
}
