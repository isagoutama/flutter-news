import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/constants/constants.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final Function onRefresh;
  final double width;
  final double height;

  const ErrorView(
      {Key? key,
      required this.message,
      required this.onRefresh,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(message, style: kTitleCard),
          TextButton(
            onPressed: () => onRefresh(),
            child: Text("Muat Ulang"),
            style: flatButtonStyle,
          )
        ],
      ),
    );
  }
}
