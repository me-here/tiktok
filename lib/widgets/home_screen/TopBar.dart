import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  static const double _spacing = 10;
  static const double _fontSize = 18;

  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool followingSelected = false;

  void _toggleSelected() {
    setState(() {
      followingSelected = !followingSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: GestureDetector(
              onTap: _toggleSelected,
              child: Text(
                'Following',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TopBar._fontSize,
                    fontWeight: followingSelected
                        ? FontWeight.bold
                        : FontWeight.normal),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: TopBar._spacing),
          ),
          Text(
            '|',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: TopBar._fontSize * 0.75,
            ),
          ),
          Container(
            child: GestureDetector(
              onTap: _toggleSelected,
              child: Text(
                'For You',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TopBar._fontSize,
                  fontWeight:
                      followingSelected ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: TopBar._spacing),
          ),
        ],
      ),
    );
  }
}
