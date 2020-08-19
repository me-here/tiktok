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
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
    } on Exception catch (_) {
      print('Not working');
    }
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isReady = true;
      });
    });
  }

  void initState() {
    super.initState();
    getCameras();
  }

  @override
  Widget build(BuildContext context) {
    return !_isReady
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    child: Text('Hello'),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                ],
              )
            ],
          );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
