import 'package:explore_app/constants/constants.dart';

class Urls {
  static const String base_url = "https://newsapi.org/v2/";
  static const String top_headlines_url = "${base_url}top-headlines?country=us&apiKey=${Constants.API_KEY}";
}