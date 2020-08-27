import 'package:flutter/material.dart';

class VideoStatus with ChangeNotifier {
  bool _isVidPlaying = true;

  bool get isVidPlaying {
    return _isVidPlaying;
  }

  void setVidStatus(bool isPlaying) {
    _isVidPlaying = isPlaying;
    notifyListeners();
  }
}
