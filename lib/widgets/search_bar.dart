import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(fontSize: 18),
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
            hintText: "Search News",
            filled: true,
            fillColor: Colors.grey[200]),
      ),
    );
  }
}
