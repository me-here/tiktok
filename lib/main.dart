import 'package:flutter/material.dart';
import 'package:tiktok/widgets/Camera.dart';

import './screens/AddScreen.dart';
import './screens/CommentScreen.dart';
import './screens/HomeScreen.dart';
import './screens/SearchScreen.dart';
import './screens/ProfileScreen.dart';

import './widgets/BottomNavigation.dart';

void main() {
  runApp(
    MaterialApp(
      title: "TikTok",
      home: TikTok(),
    ),
  );
}

class TikTok extends StatefulWidget {
  @override
  _TikTokState createState() => _TikTokState();
}

class _TikTokState extends State<TikTok> {
  int currentPage = 0;

  /// These are all the screens.
  List<Widget> get pages {
    return [
      HomeScreen(buildUI),
      SearchScreen(buildUI),
      AddScreen(buildUI),
      CommentScreen(buildUI),
      ProfileScreen(buildUI),
    ];
  }

  /// This builds the screen UI with a front and back layer, if needed.
  /// The navigation bar shares space with the front layer.
  Stack buildUI({@required Widget frontLayer, Widget backLayer}) {
    return Stack(
      children: [
        if (backLayer != null) backLayer,
        Column(
          children: [
            Expanded(
              child: frontLayer,
            ),
            BottomNavigation(currentPage, _changePage),
          ],
        ),
      ],
    );
  }

  /// Changes the page to the selected page.
  void _changePage(int i) {
    setState(() {
      currentPage = i;
    });
  }

  /// Displays the current page.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentPage],
      ),
    );
  }
}
