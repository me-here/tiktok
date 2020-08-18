import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({
    Key key,
  }) : super(key: key);

  static const navPaths = [
    {'icon': Icons.home},
    {'icon': Icons.search},
    {'icon': Icons.add_box},
    {'icon': Icons.mode_comment},
    {'icon': Icons.person},
  ];

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexSelected = 0;

  void _setIndexSelected(int i) {
    setState(() {
      indexSelected = i;
    });
  }

  Widget _navIcon(
      {BuildContext context, IconData icon, bool isSelected, int index}) {
    return GestureDetector(
      onTap: () => _setIndexSelected(index),
      child: Stack(
        children: [
          Container(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: IconTheme.of(context).size,
              height: 2,
              color: isSelected ? Colors.white : null,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            List<Widget>.generate(BottomNavigation.navPaths.length, (index) {
          return _navIcon(
            context: context,
            icon: BottomNavigation.navPaths[index]['icon'],
            isSelected: index == indexSelected ? true : false,
            index: index,
          );
        }),
      ),
    );
  }
}
