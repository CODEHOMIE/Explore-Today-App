import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class Source {
    Source();

    String id;
    String name;
    
    factory Source.fromJson(Map<String,dynamic> json) => _$SourceFromJson(json);
    Map<String, dynamic> toJson() => _$SourceToJson(this);
}
