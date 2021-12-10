import 'package:flutter_news/utils/env.dart';

class Header {
  Header._();

  static const String apiKey = 'X-Api-Key';
  static Map<String, String> buildHeader() {
    Map<String, String> headers = Map<String, String>();
    headers[Header.apiKey] = Env.apiKey;

    return headers;
  }
}
