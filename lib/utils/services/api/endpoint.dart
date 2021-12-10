import 'package:flutter_news/utils/env.dart';

class Endpoint {
  Endpoint._();
  static final String baseUrl = Env.baseUrl;
  static Uri everything({Map<String, dynamic>? query}) =>
      Uri.https(baseUrl, "v2/everything", query);
  static Uri topHeadline({Map<String, dynamic>? query}) =>
      Uri.https(baseUrl, "v2/top-headlines", query);
}
