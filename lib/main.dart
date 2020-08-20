import 'package:flutter/material.dart';

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
  int indexSelected = 0;

  List<Widget> get pages {
    return [
      HomeScreen(buildUI),
      SearchScreen(buildUI),
      AddScreen(buildUI),
      CommentScreen(buildUI),
      ProfileScreen(buildUI),
    ];
  }

  Stack buildUI({@required Widget frontLayer, Widget backLayer}) {
    return Stack(
      children: [
        if (backLayer != null) backLayer,
        Column(
          children: [
            Expanded(
              child: frontLayer,
            ),
            BottomNavigation(indexSelected, _setIndexSelected),
          ],
        ),
      ],
    );
  }

  void _setIndexSelected(int i) {
    setState(() {
      indexSelected = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[indexSelected],
      ),
    );
  }
}
