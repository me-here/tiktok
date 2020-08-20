import 'package:flutter/material.dart';

class WhiteAppBar extends StatelessWidget {
  final IconData leading;
  final IconData trailing;

  WhiteAppBar({this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            leading,
            color: Colors.black,
          ),
          Text(
            "Username",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Icon(
            trailing,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
