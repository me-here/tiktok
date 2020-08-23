import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      decoration: InputDecoration(
        fillColor: Colors.grey[300],
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
