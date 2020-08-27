import 'package:flutter/material.dart';

class VideoGrids extends StatefulWidget {

  final tabController;
  VideoGrids(this.tabController);

  @override
  _VideoGridsState createState() => _VideoGridsState(this.tabController);
}

class _VideoGridsState extends State<VideoGrids> {

  final tabController;
  _VideoGridsState(this.tabController);

  @override
  Widget build(BuildContext context) {

    List<String> userVideos = [
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
      "https://www.bing.com/th?id=OIP.8ocMi6RRdWyTK2I7KSdDJQHaEK&w=194&h=106&c=8&rs=1&qlt=90&dpr=1.25&pid=3.1&rm=2",
      "https://2.bp.blogspot.com/-lfwoBpXpf8w/Wk_SHcRAjEI/AAAAAAAB28g/zd-02oGRadgXaOt-o9nuS3GxK3ZFZpC3wCLcBGAs/s1600/funny-animals-298-01.jpg",
      "https://allthatsinteresting.com/wordpress/wp-content/uploads/2018/12/squirrel-hands-up.jpeg",
      "https://i.ytimg.com/vi/CSHbSe7iW_E/maxresdefault.jpg",
    ];

    List<String> userLikedVideos = [];

    List<String> userPrivateVideos = [];

    //Calculates the height of the gridview with all elements
    double gridVidAspectRatio = 27 / 35; //vidWidth/vidHeight


    final userVideoGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userVideos.length, (index) {
          return Container(
            child: Image.network(
              userVideos[index],
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );

    final userVideoLikedGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userLikedVideos.length, (index) {
          return Container(
            child: Image.network(
              userLikedVideos[index],
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );

    final userVideoPrivatesGrid = IgnorePointer(
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        shrinkWrap: true,
        childAspectRatio: gridVidAspectRatio,
        children: List.generate(userPrivateVideos.length, (index) {
          return Container(
            child: Image.network(
              userPrivateVideos[index],
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );

    final gridsWithCorrespondingTabs = SliverFillRemaining(
      child: TabBarView(
        controller: tabController,
        children: <Widget>[
          userVideoGrid,
          userVideoLikedGrid,
          userVideoPrivatesGrid,
        ],
      ),
    );

    return gridsWithCorrespondingTabs;
  }
}
