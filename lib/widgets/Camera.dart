import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  List<CameraDescription> cameras;
  CameraController _controller;
  List<IconButton> _topButtons = [
    IconButton(
      icon: Icon(
        Icons.exit_to_app,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(
        Icons.color_lens,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(
        Icons.music_note,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(
        Icons.timelapse,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(
        Icons.slow_motion_video,
        color: Colors.white,
        size: 30,
      ),
      onPressed: () {},
    ),
  ];

  Future<void> getCameras() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.ultraHigh);
      await _controller.initialize();
    } on Exception catch (_) {
      print('Not working');
    }

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  void initState() {
    super.initState();
    getCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          /*Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 200,
        child: ListView(
          children: _topButtons,
          scrollDirection: Axis.horizontal,
        ),
      ),*/
          _controller == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(_controller),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: RawMaterialButton(
                              fillColor: Colors.teal,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Effects',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: RawMaterialButton(
                              fillColor: Colors.red,
                              padding: EdgeInsets.all(35),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Tap to Shoot',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: RawMaterialButton(
                              fillColor: Colors.yellow,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Upload',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.05),
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: _topButtons.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Container(
                              margin: EdgeInsets.all(20),
                              child: _topButtons[index],
                            );
                          }),
                    ),
                  ],
                ),
    );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
