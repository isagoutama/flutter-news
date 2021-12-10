import 'package:flutter/material.dart';
import 'package:flutter_news/constants/constants.dart';
import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/screens/home/components/article/bloc/article_bloc.dart';
import 'package:flutter_news/screens/home/components/article/bloc/article_state.dart';
import 'package:flutter_news/screens/news/detail/news_detail_screen.dart';
import 'package:flutter_news/widgets/error_view.dart';
import 'package:flutter_news/widgets/loader_view.dart';

class HomeArticles extends StatefulWidget {
  @override
  _HomeArticlesState createState() => _HomeArticlesState();
}

class _HomeArticlesState extends State<HomeArticles> {
  final ArticleBloc bloc = ArticleBloc();

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
          return Container(
            child: Column(
              children: List.generate(dataState.articles.length, (index) {
                final Article article = dataState.articles[index];
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewsDetailScreen(article: article))),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      width: size.width,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              article.urlToImage ?? noImageUrl,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getTruncatedTitle(article.title, 70),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [Text(article.publishedAt)],
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        });
  }

  String getTruncatedTitle(String title, int truncateNumber) {
    return title.length > truncateNumber
        ? title.substring(0, truncateNumber) + "..."
        : title;
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
