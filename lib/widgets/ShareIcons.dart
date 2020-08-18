import 'package:flutter/material.dart';

class ShareIcons extends StatefulWidget {
  const ShareIcons({
    Key key,
  }) : super(key: key);

  @override
  _ShareIconsState createState() => _ShareIconsState();
}

class _ShareIconsState extends State<ShareIcons> {
  var isLiked = false;
  var numLikes = 0;
  var numComments = 0;
  var numShares = 0;

  void _buttonFunction() {
    setState(() {
      if (isLiked) {
        numLikes--;
      } else {
        numLikes++;
      }
      isLiked = !isLiked;
    });
  }

  void _commentFunction() {}

  void _shareFunction() {}

  @override
  Widget build(BuildContext context) {
    Widget _createIcon(IconData iconType, Function iconFunction, int textNum) {
      return Column(
        children: [
          IconButton(
            icon: Icon(
              iconType,
              color: (isLiked && iconType == Icons.favorite)
                  ? Colors.red
                  : Colors.white,
            ),
            iconSize: MediaQuery.of(context).size.width * .1,
            splashRadius: 10,
            onPressed: () {
              iconFunction();
            },
          ),
          Text(
            textNum.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width * .04,
            ),
          ),
        ],
      );
    }

    final _iconSize = MediaQuery.of(context).size.width * .05;

    final profilePic = Container(
      child: Container(
        margin: EdgeInsets.only(bottom: _iconSize / 2),
        child: Stack(
          alignment: Alignment.bottomCenter,
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: MediaQuery.of(context).size.width * .058,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://www.adrants.com/images/tik_tok_logo.jpeg"),
                radius: MediaQuery.of(context).size.width * .055,
              ),
            ),
            Positioned(
              bottom: -MediaQuery.of(context).size.width * .02,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: _iconSize,
                ),
              ),
            )
          ],
        ),
      ),
    );

    final audioDisc = CircleAvatar(
      backgroundColor: Color.fromRGBO(69, 71, 73, 1), //Dark Gray
      radius: MediaQuery.of(context).size.width * .075,
      child: CircleAvatar(
        backgroundImage:
            NetworkImage("http://www.adrants.com/images/tik_tok_logo.jpeg"),
        radius: MediaQuery.of(context).size.width * .045,
      ),
    );

    return Container(
      width: MediaQuery.of(context).size.width * .18,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .23,
          ),
          profilePic,
          _createIcon(Icons.favorite, _buttonFunction, numLikes),
          _createIcon(Icons.chat_bubble, _commentFunction, numComments),
          _createIcon(Icons.forward, _shareFunction, numShares),
          audioDisc,
        ],
      ),
    );
  }
}
