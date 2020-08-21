import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/WhiteAppBar.dart';
import '../widgets/ProfileInfo.dart';

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
    double gridVidAspectRatio = 27 / 35; //vidWidth/vidHeight

    final profileAppBar = WhiteAppBar(
      leading: Icons.perm_identity,
      trailing: Icons.menu,
    );

    final tabsBar = SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.apps),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.black,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lock),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
    );

    final usersVideoGrid = SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 3,
      mainAxisSpacing: 3,
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
            child: CustomScrollView(
              slivers: <Widget>[
                ProfileInfo(),
                tabsBar,
                usersVideoGrid,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
