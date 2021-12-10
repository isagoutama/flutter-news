import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/search_bar.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchBar()),
        SizedBox(width: 10),
        Icon(Icons.menu, size: 30)
      ],
    );
  }
}
