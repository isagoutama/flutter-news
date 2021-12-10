import 'dart:async';

import 'package:flutter_news/models/api_response.dart';
import 'package:flutter_news/screens/home/components/headline/bloc/headline_state.dart';
import 'package:flutter_news/utils/services/api/api_service.dart';

class HeadlineBloc {
  StreamController _streamController = StreamController();
  StreamSink get _sink => _streamController.sink;
  Stream get output => _streamController.stream;

  HeadlineBloc() {
    _sink.add(DataState([]));
  }

  void getArticles() async {
    _sink.add(LoadingState());
    final ApiResponse response = await ApiService.getHeadlines();
    print(response.body);
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
