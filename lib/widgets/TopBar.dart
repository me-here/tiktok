import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  static const double _spacing = 10;
  static const double _fontSize = 18;
  final followingSelected;

  const TopBar({
    this.followingSelected,
    Key key,
  }) : super(key: key);

  const TopBar._({this.followingSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              'Following',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: _fontSize,
                  fontWeight:
                      followingSelected ? FontWeight.bold : FontWeight.normal),
            ),
            margin: EdgeInsets.symmetric(horizontal: _spacing),
          ),
          Text(
            '|',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: _fontSize * 0.75,
            ),
          ),
          Container(
            child: Text(
              'For You',
              style: TextStyle(
                color: Colors.white,
                fontSize: _fontSize,
                fontWeight:
                    followingSelected ? FontWeight.normal : FontWeight.bold,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: _spacing),
          ),
        ],
      ),
    );
  }
}
