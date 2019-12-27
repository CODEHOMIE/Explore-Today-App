import 'dart:convert';
import 'package:explore_app/api/urls.dart';
import 'package:explore_app/models/article.dart';
import 'package:explore_app/models/articles.dart';
import 'package:http/http.dart' as http;

class Services {
  static Future<Article> getArticles() async {
    try {
      final response = await http.get(Urls.top_headlines_url);
      if (isResponceOk(response)) {
        return parseCategories(response.body);
      }
      return Article();
    } catch (e) {
      return Article();
    } 
  } 

  static Article parseCategories(String responseBody) {
    final parsed =
        json.decode(responseBody)["articles"].cast<Map<String, dynamic>>();
    List<Articles> articles =
        parsed.map<Articles>((json) => Articles.fromJson(json)).toList();
    Article a = Article();
    a.articles = articles;
    return a;
  }

  static bool isResponceOk(http.Response response) {
    if (200 != response.statusCode) {
      return false;
    }
    return true;
  }
}