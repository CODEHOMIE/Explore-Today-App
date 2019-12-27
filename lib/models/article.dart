import 'package:json_annotation/json_annotation.dart';
import "articles.dart";
part 'article.g.dart';

@JsonSerializable()
class Article {
    Article();

    String status;
    num totalResults;
    List<Articles> articles;
    
    factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);
    Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
