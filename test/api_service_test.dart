import 'package:flutter_news/models/api_response.dart';
import 'package:flutter_news/utils/env.dart';
import 'package:flutter_news/utils/services/api/api_service.dart';
import 'package:flutter_news/utils/services/api/endpoint.dart';
import 'package:flutter_news/utils/services/api/header.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Env.setEnvironment(Environment.DEV);

  test("Check base URL", () {
    expect(Endpoint.baseUrl, equals("newsapi.org"));
  });

  test("Check API KEY", () {
    expect(Env.apiKey, equals("c211616820814c2ca9813185d64aee37"));
  });

  test("Check Header ", () {
    expect(Header.buildHeader()[Header.apiKey], equals(Env.apiKey));
  });

  test("Get everything", () async {
    final ApiResponse response = await ApiService.getEverything();
    expect(response.statusCode, equals(200));
  });

  test("Get headlines", () async {
    final ApiResponse response = await ApiService.getHeadlines();
    expect(response.isOk(), equals(true));
  });
}
