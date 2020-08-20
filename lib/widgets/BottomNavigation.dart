import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentPage;
  final Function changePage;
  BottomNavigation(this.currentPage, this.changePage);

  static const navPaths = [
    {'icon': Icons.home},
    {'icon': Icons.search},
    {'icon': Icons.add_box},
    {'icon': Icons.mode_comment},
    {'icon': Icons.person},
  ];

  /// If in home page, icon color is white.
  Color get _iconColor {
    return currentPage == 0 ? Colors.white : Colors.grey;
  }

  /// Returns a navigation icon with a little bar underneath it if it is the active tab.
  Widget _navIcon(
      {BuildContext context, IconData icon, bool isSelected, int index}) {
    return GestureDetector(
      onTap: () => changePage(index),
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
      // This gives the little upper border
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // Make nav icons out of the navPaths model.
        children: List<Widget>.generate(
          BottomNavigation.navPaths.length,
          (index) {
            return _navIcon(
              context: context,
              icon: BottomNavigation.navPaths[index]['icon'],
              isSelected: index == currentPage ? true : false,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
