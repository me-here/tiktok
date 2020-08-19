import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoWidget> {
  VideoPlayerController _controller;
  bool _isLoading = true;
  bool _playIsVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        print('initializing');
        setState(() {
          _controller.play();
          _isLoading = false;
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {

    //Stack for Video Player, Play Icon, and Pausing Area
    return Stack(
      children: [

        //Adding Video Player in Background
        !_isLoading
            ? SizedBox(
                height: double.infinity,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),

        //Adding Play Icon When Video is Paused
        Center(
          child: Visibility(
            visible: _playIsVisible,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white.withOpacity(0.7),
              size: 90,
            ),
          ),
        ),

        //Video Area Button for Detecting When to Pause
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Opacity(
            opacity: 0.0,
            child: RaisedButton(
              onPressed: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _playIsVisible = true;
                    _controller.pause();
                  } else {
                    _playIsVisible = false;
                    _controller.play();
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
