import 'package:flutter/material.dart';

class ProfileContentTabs extends StatefulWidget {

  final tabController;
  ProfileContentTabs(this.tabController);

  @override
  _ProfileContentTabsState createState() => _ProfileContentTabsState(tabController);
}

class _ProfileContentTabsState extends State<ProfileContentTabs>  {

  final tabController;
  _ProfileContentTabsState(this.tabController);

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      backgroundColor: Colors.white,
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
