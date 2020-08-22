import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/widgets/WhiteAppBar.dart';
import '../widgets/ProfileInfo.dart';
import '../widgets/ProfileContentTabs.dart';
import '../widgets/VideoGrids.dart';

/// This is where you see your profile.
class ProfileScreen extends StatefulWidget {
  final Function buildUI;

  ProfileScreen(this.buildUI);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    TabController tabControl = new TabController(vsync: this, length: 3);

    final profileAppBar = WhiteAppBar(
      leading: Icons.perm_identity,
      trailing: Icons.menu,
    );


    return widget.buildUI(
      frontLayer: Column(
        children: [
          profileAppBar,
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                ProfileInfo(),
                ProfileContentTabs(tabControl),
                VideoGrids(tabControl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
