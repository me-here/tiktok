import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoWidget> {
  VideoPlayerController _controller;
  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        print('initializing');
        setState(() {
          _isInit = !_isInit;
          _controller.play();
          _controller.setLooping(true);

        });
      });
    print("initState: ${_isInit}");
  }

  @override
  Widget build(BuildContext context) {
    print("build: ${_controller.value.initialized}");
    return _controller.value.initialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
