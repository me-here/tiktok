import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This is where you see your profile.
class ProfileScreen extends StatefulWidget {
  final Function buildUI;

  ProfileScreen(this.buildUI);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
    ];

    //Calculates the height of the gridview with all elements
    double gridVidAspectRatio = 27/35; //vidWidth/vidHeight
    double gridViewContentHeight = (MediaQuery.of(context).size.width / 3.0) *
        (images.length / 3.0).ceil() * (1 / gridVidAspectRatio);

    Widget _createStats(int statNum, String statName) {
      return Container(
        width: 110,
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

    final profileAppBar = AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.perm_identity,
            color: Colors.black,
          ),
          Text(
            "Username",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ],
      ),
    );

    final profileInfoArea = Container(
      height: MediaQuery.of(context).size.height * .4,
      child: Column(
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
      ),
    );

    final profileContentTabBar = Container(
      height: MediaQuery.of(context).size.height * .07,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lock),
            onPressed: () {},
          ),
        ],
      ),
    );

    final usersVideoGrid = GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: gridVidAspectRatio,
      children: List.generate(images.length, (index) {
        return Container(
          child: Image.network(
            images[index],
            fit: BoxFit.fill,
          ),
        );
      }),
    );

    return widget.buildUI(
      frontLayer: Column(
        children: [
          profileAppBar,
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .48 +
                    gridViewContentHeight,
                child: Column(
                  children: [
                    profileInfoArea,
                    profileContentTabBar,
                    usersVideoGrid,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
