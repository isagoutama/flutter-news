import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/constants/constants.dart';

class LoarderView extends StatelessWidget {
  final double width;
  final double height;

  const LoarderView({Key? key, required this.width, required this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Loading gan ...", style: kTitleCard),
        ],
      ),
    );
  }
}
