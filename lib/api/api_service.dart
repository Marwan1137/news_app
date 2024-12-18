import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/models/sources_response/sources_response.dart';

class APIService {
  static Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.sourceEndpoint,
      {
        'apiKey': APIConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.newsEndpoint,
      {
        'apiKey': APIConstants.apiKey,
        'sources': sourceId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> searchNews(String query) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.newsEndpoint,
      {
        'apiKey': APIConstants.apiKey,
        'q': query,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
