import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final indexSelected;

  const BottomNavigation({
    @required this.indexSelected,
    Key key,
  }) : super(key: key);

  static const navPaths = [
    {'icon': Icons.home},
    {'icon': Icons.search},
    {'icon': Icons.add_box},
    {'icon': Icons.mode_comment},
    {'icon': Icons.person},
  ];

  Widget _navIcon({BuildContext context, IconData icon, bool isSelected}) {
    return GestureDetector(
      onTap: () => print("tapped nav $icon"),
      child: Stack(
        children: [
          Container(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            padding: EdgeInsets.only(top: 8, bottom: 8),
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
      color: Colors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List<Widget>.generate(navPaths.length, (index) {
          return _navIcon(
            context: context,
            icon: navPaths[index]['icon'],
            isSelected: index == indexSelected ? true : false,
          );
        }),
      ),
    );
  }
}
