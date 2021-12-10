import 'package:flutter_news/models/article.dart';

abstract class HeadlineState {}

class LoadingState extends HeadlineState {}

class DataState extends HeadlineState {
  final List<Article> articles;

  DataState(this.articles);
}

class ErrorState extends HeadlineState {
  final String message;
  ErrorState(this.message);
}
