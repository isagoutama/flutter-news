import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/constants/constants.dart';
import 'package:flutter_news/screens/home/components/headline/bloc/headline_bloc.dart';
import 'package:flutter_news/screens/home/components/headline/bloc/headline_state.dart';
import 'package:flutter_news/screens/news/detail/news_detail_screen.dart';
import 'package:flutter_news/widgets/error_view.dart';
import 'package:flutter_news/widgets/loader_view.dart';

class HomeHeadline extends StatefulWidget {
  @override
  _HomeHeadlineState createState() => _HomeHeadlineState();
}

class _HomeHeadlineState extends State<HomeHeadline> {
  final bloc = HeadlineBloc();

  @override
  void initState() {
    bloc.getArticles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: bloc.output,
        builder: (context, snapshot) {
          if (snapshot.data is LoadingState) {
            return LoarderView(
              height: 100,
              width: size.width,
            );
          } else if (snapshot.data is ErrorState) {
            final ErrorState errorState = (snapshot.data as ErrorState);
            return ErrorView(
                message: errorState.message,
                onRefresh: () {
                  bloc.getArticles();
                },
                width: size.width,
                height: 100);
          }
          final DataState dataState = (snapshot.data as DataState);
          return CarouselSlider(
            options: CarouselOptions(height: 250.0),
            items: dataState.articles.map((article) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NewsDetailScreen(article: article))),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        // decoration: BoxDecoration(color: Colors.amber),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                article.urlToImage ?? noImageUrl,
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              width: size.width,
                              height: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xCC000000),
                                        Color(0x00000000),
                                        Color(0x00000000),
                                        Color(0xCC000000),
                                      ])),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.all(20),
                                child: Text(article.title,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15)),
                              ),
                            )
                          ],
                        )),
                  );
                },
              );
            }).toList(),
          );
        });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
