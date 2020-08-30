import 'package:flutter/material.dart';

class ProfileContentTabs extends StatefulWidget {
  final tabController;
  ProfileContentTabs(this.tabController);

  @override
  _ProfileContentTabsState createState() =>
      _ProfileContentTabsState(tabController);
}

class _ProfileContentTabsState extends State<ProfileContentTabs> {
  final tabController;
  _ProfileContentTabsState(this.tabController);

  @override
  Widget build(BuildContext context) {
    // return SliverAppBar(
    //   // backgroundColor: Colors.white,
    //   expandedHeight: 300,
    //   centerTitle: true,
    //   title: TabBar(
    //     tabs: [
    //       Text(
    //         'helo',
    //         style: TextStyle(color: Colors.black),
    //         textAlign: TextAlign.center,
    //       ),
    //     ],
    //   ),
    // );

    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      pinned: true,
      title: TabBar(
        tabs: [
          Icon(
            Icons.apps,
            color: Colors.black,
          ),
          Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          Icon(
            Icons.lock,
            color: Colors.black,
          ),
        ],
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.label,
        controller: tabController,
      ),
    );
  }
}
