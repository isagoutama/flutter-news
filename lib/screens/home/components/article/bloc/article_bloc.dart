import 'dart:async';

import 'package:flutter_news/models/api_response.dart';
import 'package:flutter_news/screens/home/components/article/bloc/article_state.dart';
import 'package:flutter_news/utils/services/api/api_service.dart';

class ArticleBloc {
  StreamController _streamController = StreamController();
  StreamSink get _sink => _streamController.sink;
  Stream get output => _streamController.stream;

  ArticleBloc() {
    _sink.add(DataState([]));
  }

  void getArticles() async {
    _sink.add(LoadingState());
    final ApiResponse response = await ApiService.getEverything();
    if (response.isOk()) {
      _sink.add(DataState(response.body));
    } else {
      _sink.add(ErrorState(response.body));
    }
  }

  void dispose() {
    _streamController.close();
  }
}
