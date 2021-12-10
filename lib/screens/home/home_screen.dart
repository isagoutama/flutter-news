import 'package:flutter/material.dart';
import 'package:flutter_news/screens/home/components/article/home_articles.dart';
import 'package:flutter_news/screens/home/components/headline/home_headline.dart';
import 'package:flutter_news/widgets/category_selector.dart';
import 'package:flutter_news/widgets/top_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopBar(),
                    SizedBox(height: 10),
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text("Silakan korannya mas :')")
                  ],
                )),
            SizedBox(height: 10),
            HomeHeadline(),
            SizedBox(height: 10),
            CategorySelector(),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [HomeArticles()],
              ),
            )
          ],
        ),
      )),
    );
  }
}
