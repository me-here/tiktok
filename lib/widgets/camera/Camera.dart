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
  CameraController _controller;

  String videoPath;
  String timestamp() => new DateTime.now().millisecondsSinceEpoch.toString();
  bool _isRecording = false;

  Future<void> getCameras() async {
    try {
      // Make sure widget tree is bound to changes in state?
      WidgetsFlutterBinding.ensureInitialized();

      // Get cameras, use back cam
      final cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.medium);

      // Initialize cam
      await _controller.initialize().then((_) {
        // if it has a place on the screen, rebuild the widget.
        if (!mounted) {
          return;
        }
        setState(() {});
      });

      // prepare for recording
      await _controller.prepareForVideoRecording();
    } on Exception catch (_) {
      print('Not working');
    }
  }

  /// Handles starting the recording (whole process).
  void onStartRecord() {
    startVideoRecording().then((String filePath) {
      toggleRecordingMode();
      print("onStartRecord: _startRecording - $_isRecording");
      print("onStartRecord: filePath - $filePath");

      if (filePath != null) {
        showSnackBar('onStartRecord: Saving video to $filePath');
      }
    });
  }

  /// Handles stopping the recording (whole process).
  void onStopRecord() {
    stopVideoRecording().then((_) {
      toggleRecordingMode();
      showSnackBar('onStopRecord: Saving video to $videoPath');
    });
  }

  /// Toggles the boolean _isRecording and rebuilds the UI accordingly.
  void toggleRecordingMode() {
    if (mounted) {
      setState(() {
        _isRecording = !_isRecording;
      });
    }
  }

  Future<String> startVideoRecording() async {
    // If you're recording already you must stop first.
    if (_controller.value.isRecordingVideo) {
      return null;
    }

    // Get documents directory.
    final Directory extDir = await getApplicationDocumentsDirectory();

    // Create new directory at documents/Videos if it doesn't exist.
    final String dirPath = '${extDir.path}/Videos';
    await new Directory(dirPath).create(recursive: true);

    // Where the file should be stored.
    final String filePath = '$dirPath/${timestamp()}.mp4';

    try {
      videoPath = filePath;

      // Record video & save at this path.
      await _controller.startVideoRecording(videoPath);
      print('startVideoRecording: ${_controller.value.isRecordingVideo}');
    } on Exception catch (e) {
      _showException(e);
      return null;
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    // Must start before you stop.
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
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
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
    if (_controller == null) {
      return Center(child: CircularProgressIndicator());
    }

    /// This is the actual preview you see of the camera.
    final _cameraPreview = Container(
      height: MediaQuery.of(context).size.height, // Take up whole screen
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
        icon: Icons.photo_filter,
      ),
      _BottomCameraButton(
        alignment: Alignment.bottomCenter,
        onPressed: !_isRecording ? onStartRecord : onStopRecord,
        color: Colors.red,
        label: 'Tap to Shoot',
        icon: _isRecording ? Icons.stop : Icons.fiber_manual_record,
      ),
      _BottomCameraButton(
        alignment: Alignment.bottomRight,
        onPressed: () {},
        color: Colors.yellow,
        label: 'Upload',
        icon: Icons.file_upload,
      ),
    ];

    final _topBar = Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
      ),
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
      body: _cameraScreen,
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
  final IconData icon;

  const _BottomCameraButton({
    @required this.alignment,
    @required this.onPressed,
    @required this.color,
    @required this.label,
    @required this.icon,
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
                  ? EdgeInsets.all(20)
                  : EdgeInsets.all(12),
              shape: CircleBorder(),
              onPressed: onPressed,
              child: Icon(icon),
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
