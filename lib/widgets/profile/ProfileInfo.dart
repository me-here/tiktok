import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: ProfileInfoDelegate(),
    );
  }
}

class ProfileInfoDelegate extends SliverPersistentHeaderDelegate {
  double _profileInfoHeight = 300;

  Widget _createStats(int statNum, String statName) {
    return Container(
      // width: 110,
      child: Column(
        children: [
          Text(
            "$statNum",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            statName,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    _profileInfoHeight = MediaQuery.of(context).size.height * .4;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://www.adrants.com/images/tik_tok_logo.jpeg"),
              radius: MediaQuery.of(context).size.width * .1,
            ),
            SizedBox(height: 4),
            Text(
              "@username",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _createStats(0, "Following"),
            _createStats(0, "Followers"),
            _createStats(0, "Likes"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Colors.white,
              child: Text(
                "Edit profile",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(width: 6),
            ButtonTheme(
              minWidth: 56,
              child: RaisedButton(
                color: Colors.white,
                child: Icon(Icons.bookmark_border),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  double get maxExtent => _profileInfoHeight;

  @override
  double get minExtent => _profileInfoHeight - 1;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
