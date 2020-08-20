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
  bool _isReady;

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
    setState(() {
      _isReady = true;
    });
  }

  void initState() {
    super.initState();
    getCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _controller == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                  /*Container(
                    margin: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            RawMaterialButton(
                              fillColor: Colors.teal,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                            Text(
                              'Effects',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RawMaterialButton(
                              fillColor: Colors.red,
                              padding: EdgeInsets.all(35),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                            Text('Tap to Shoot',
                                style: TextStyle(
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Column(
                          children: [
                            RawMaterialButton(
                              fillColor: Colors.yellow,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                              onPressed: () {},
                            ),
                            Text(
                              'Upload',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )*/
                ],
              ));
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
