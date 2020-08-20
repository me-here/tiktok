import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int indexSelected;
  final Function setIndexSelected;
  BottomNavigation(this.indexSelected, this.setIndexSelected);

  static const navPaths = [
    {'icon': Icons.home},
    {'icon': Icons.search},
    {'icon': Icons.add_box},
    {'icon': Icons.mode_comment},
    {'icon': Icons.person},
  ];

  Color get _iconColor {
    return indexSelected == 0 ? Colors.white : Colors.grey;
  }

  Widget _navIcon(
      {BuildContext context, IconData icon, bool isSelected, int index}) {
    return GestureDetector(
      onTap: () => setIndexSelected(index),
      child: Stack(
        children: [
          Container(
            child: Icon(
              icon,
              color: _iconColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: IconTheme.of(context).size,
              height: 2,
              color: isSelected ? _iconColor : null,
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
