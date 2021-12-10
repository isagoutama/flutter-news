import 'package:flutter_news/models/article.dart';

abstract class ArticleState {}

class LoadingState extends ArticleState {}

class DataState extends ArticleState {
  final List<Article> articles;

  DataState(this.articles);
}

class ErrorState extends ArticleState {
  final String message;
  ErrorState(this.message);
}
