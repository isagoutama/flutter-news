import 'dart:convert';
import 'dart:io';

import 'package:flutter_news/models/article.dart';
import 'package:flutter_news/utils/services/api/api_message.dart';
import 'package:flutter_news/utils/services/api/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_news/models/api_response.dart';
import 'package:flutter_news/utils/services/api/header.dart';

class ApiService {
  ApiService._();

  static Future<ApiResponse> getEverything({String? search}) async {
    try {
      final Uri url = Endpoint.everything(query: {"q": (search ?? "a")});
      final response = await http.get(url, headers: Header.buildHeader());
      Map<String, dynamic> apiResponse = json.decode(response.body);
      // print(apiResponse);

      if (response.statusCode == 200) {
        try {
          final List<Article> articles = List.from(apiResponse['articles'])
              .map((e) => Article.fromJson(e))
              .toList();
          if (articles.length > 0) {
            return ApiResponse(response.statusCode, articles);
          }
          return ApiResponse(404, ApiMessage.notFound);
        } catch (e) {
          return ApiResponse(0, ApiMessage.parsingError);
        }
      } else {
        return ApiResponse(response.statusCode, apiResponse['message']);
      }
    } catch (e) {
      print(e);
      if (e is IOException) {
        return ApiResponse(0, ApiMessage.noConnection);
      } else {
        return ApiResponse(0, ApiMessage.unknownError);
      }
    }
  }

  static Future<ApiResponse> getHeadlines() async {
    try {
      final Uri url =
          Endpoint.topHeadline(query: {"country": "id", "pageSize": "5"});
      final response = await http.get(url, headers: Header.buildHeader());
      Map<String, dynamic> apiResponse = json.decode(response.body);
      // print(apiResponse['artcles'][]);
      if (response.statusCode == 200) {
        try {
          final List<Article> articles =
              List.from(apiResponse['articles']).map((e) {
            print(e);
            return Article.fromJson(e);
          }).toList();
          if (articles.length > 0) {
            return ApiResponse(response.statusCode, articles);
          }
          return ApiResponse(404, ApiMessage.notFound);
        } catch (e) {
          print(e);
          return ApiResponse(0, ApiMessage.parsingError);
        }
      } else {
        return ApiResponse(response.statusCode, apiResponse['message']);
      }
    } catch (e) {
      print(e);
      if (e is IOException) {
        return ApiResponse(0, ApiMessage.noConnection);
      } else {
        return ApiResponse(0, ApiMessage.unknownError);
      }
    }
  }
}
