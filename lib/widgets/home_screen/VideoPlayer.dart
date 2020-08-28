import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:video_player/video_player.dart';
import 'package:tiktok/providers/VideoStatus.dart';

class VideoWidget extends StatefulWidget {
  final String videoLink;

  VideoWidget(this.videoLink);

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
    initializeController();
  }

  Future<void> initializeController() async {
    _controller = VideoPlayerController.network(
      widget.videoLink,
    );
    await _controller.initialize();

    setState(() {
      _isLoading = false;
      _controller.play();
      _controller.setLooping(true);
    });

    //Sets the video status to isPlaying true for disc rotation animation
    Provider.of<VideoStatus>(context, listen: false)
        .setVidStatus(_controller.value.isPlaying);
  }

  void togglePause() {
    setState(() {
      _playIsVisible = !_playIsVisible;
      _controller.value.isPlaying ? _controller.pause() : _controller.play();

      //Listens for a change in video playing and sends it to ShareIcons.dart for the rotating disc animation
      Provider.of<VideoStatus>(context, listen: false)
          .setVidStatus(_controller.value.isPlaying);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Stack for Video Player, Play Icon, and Pausing Area
    return Stack(
      children: [
        //Adding Video Player in Background
        !_isLoading
            ? VideoPlayer(_controller)
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),

        //Adding Play Icon When Video is Paused
        Center(
          child: _playIsVisible
              ? Icon(
                  Icons.play_arrow,
                  color: Colors.white.withOpacity(0.7),
                  size: 90,
                )
              : null,
        ),

        //Video Area Button for Detecting When to Pause
        GestureDetector(
          onTap: togglePause,
          behavior: HitTestBehavior.translucent,
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
