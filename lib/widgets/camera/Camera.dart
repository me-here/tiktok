import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  List<CameraDescription> cameras;
  CameraController _controller;

  String videoPath;
  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();
  bool _startRecording = false;

  Future<void> getCameras() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
      await _controller.prepareForVideoRecording();
    } on Exception catch (_) {
      print('Not working');
    }

    if (!mounted) {
      return;
    }
    setState(() {});
  }

  void onStartRecord() {
    startVideoRecording().then((String filePath) {
      if (mounted) {
        setState(() {
          _startRecording = !_startRecording;
        });
        print("onStartRecord: _startRecording - $_startRecording");
        print("onStartRecord: filePath - $filePath");
      }
      if (filePath != null) {
        showSnackBar('onStartRecord: Saving video to $filePath');
      }
    });
  }

  void onStopRecord() {
    stopVideoRecording().then((_) {
      if (mounted) {
        this.setState(() {
          _startRecording = !_startRecording;
        });
      }
      showSnackBar('onStopRecord: Saving video to $videoPath');
    });
  }

  Future<String> startVideoRecording() async {
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Videos';
    await new Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.mp4';

    if (_controller.value.isRecordingVideo) {
      return null;
    }

    try {
      videoPath = filePath;
      await _controller.startVideoRecording(videoPath);
      print('startVideoRecording: ${_controller.value.isRecordingVideo}');
    } on Exception catch (e) {
      _showException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!_controller.value.isRecordingVideo) {
      return null;
    }

    try {
      await _controller.stopVideoRecording();
    } on Exception catch (e) {
      _showException(e);
      return null;
    }
    print('stopping');
  }

  void _showException(CameraException e) {
    logError(e.code, e.description);
    showSnackBar('Error: ${e.code}\n${e.description}');
  }

  void showSnackBar(String message) {
    print(message);
  }

  void logError(String code, String message) {
    print('Error: $code\nMessage: $message');
  }

  void initState() {
    super.initState();
    getCameras();
  }

  @override
  Widget build(BuildContext context) {
    /// This is the actual preview you see of the camera.
    final _cameraPreview = Container(
      width: MediaQuery.of(context).size.width,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: CameraPreview(_controller),
      ),
    );

    /// These are the buttons at the bottom that let you shoot/record/upload.
    final _bottomButtons = [
      _BottomCameraButton(
        alignment: Alignment.bottomLeft,
        onPressed: () {},
        color: Colors.teal,
        label: 'Effects',
      ),
      _BottomCameraButton(
        alignment: Alignment.bottomCenter,
        onPressed: !_startRecording ? onStartRecord : onStopRecord,
        color: Colors.red,
        label: 'Tap to Shoot',
      ),
      _BottomCameraButton(
        alignment: Alignment.bottomRight,
        onPressed: () {},
        color: Colors.yellow,
        label: 'Upload',
      ),
    ];

    final _topBar = Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      height: MediaQuery.of(context).size.height * 0.1,
      child: _TopActionBar(),
    );

    /// This is the composition of everything that should be displayed in this screen.
    final _cameraScreen = Stack(
      children: [
        _cameraPreview,
        ..._bottomButtons,
        _topBar,
      ],
    );

    return Scaffold(
      body: _controller == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _cameraScreen,
    );
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

/// This is the circular button that lets you record and upload, etc.
class _BottomCameraButton extends StatelessWidget {
  final Alignment alignment;
  final Function onPressed;
  final Color color;
  final String label;

  const _BottomCameraButton({
    @required this.alignment,
    @required this.onPressed,
    @required this.color,
    @required this.label,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: RawMaterialButton(
              fillColor: color,
              padding: alignment == Alignment.bottomCenter
                  ? EdgeInsets.all(35)
                  : EdgeInsets.all(20),
              shape: CircleBorder(),
              onPressed: onPressed,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

/// This is the combination of all the TopButtons, forming the TopActionBar
class _TopActionBar extends StatelessWidget {
  const _TopActionBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _TopButton(icon: Icons.exit_to_app, onPressed: () => {}),
        _TopButton(icon: Icons.color_lens, onPressed: () => {}),
        _TopButton(icon: Icons.music_note, onPressed: () => {}),
        _TopButton(icon: Icons.timelapse, onPressed: () => {}),
        _TopButton(icon: Icons.slow_motion_video, onPressed: () => {}),
      ],
      scrollDirection: Axis.horizontal,
    );
  }
}

/// This widget is the top icon button in the horizontal listview.
class _TopButton extends StatelessWidget {
  const _TopButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
