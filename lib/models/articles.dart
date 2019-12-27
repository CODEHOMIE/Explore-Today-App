import 'package:json_annotation/json_annotation.dart';
import "source.dart";
part 'articles.g.dart';

@JsonSerializable()
class Articles {
    Articles();

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    String publishedAt;
    String content;
    
    factory Articles.fromJson(Map<String,dynamic> json) => _$ArticlesFromJson(json);
    Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
