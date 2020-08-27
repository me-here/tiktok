import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String username;
  final List<String> tags;

  const Description({
    @required this.username,
    this.tags,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usernameText = Text(
      "@$username",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white,
      ),
    );

    final descriptionText = Text(
      tags.fold("", (tagString, tag) => tagString += ' #$tag'),
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    );

    final musicBar = Row(
      children: [
        Icon(
          Icons.music_note,
          color: Colors.white,
        ),
        Text(
          "Tik Tok Original Sound ",
          style: TextStyle(color: Colors.white),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 30,
        top: 0,
        bottom: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          usernameText,
          SizedBox(
            height: 15,
          ),
          descriptionText,
          SizedBox(
            height: 15,
          ),
          musicBar,
        ],
      ),
    );
  }
}
