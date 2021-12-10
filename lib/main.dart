import 'package:flutter/material.dart';
import 'package:flutter_news/screens/home/home_screen.dart';
import 'package:flutter_news/utils/env.dart';

void main() {
  runApp(MyApp());
  Env.setEnvironment(Environment.DEV);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
      home: HomeScreen(),
    );
  }
}
