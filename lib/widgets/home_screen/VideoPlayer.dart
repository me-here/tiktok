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
    _controller = VideoPlayerController.network(
      widget.videoLink,
    )..initialize().then((_) {
        print('initializing');
        setState(() {
          _controller.play();
          _isLoading = false;
          _controller.setLooping(true);

          //Sets the video status to isPlaying true for disc rotation animation
          Provider.of<VideoStatus>(context, listen: false).setVidStatus(_controller.value.isPlaying);
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
                  //Listens for a change in video playing and sends it to ShareIcons.dart for the rotating disc animation
                  Provider.of<VideoStatus>(context, listen: false).setVidStatus(_controller.value.isPlaying);
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