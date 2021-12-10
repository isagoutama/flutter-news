import 'dart:ui';

import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  final List<String> categories = [
    "Hanya",
    "Sekedar",
    "Hiasan",
    "Pemanis",
    "Saja"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(left: 10),
        child: Row(
          children: List.generate(categories.length, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150),
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: isSelected ? Colors.black : Colors.white),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
