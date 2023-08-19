import 'dart:convert';
import 'ArticalModel.dart';

part 'NewsModel.g.dart';

class NewsModel {
  NewsModel(this.status, this.totalResults, this.articles);

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsModel.newsFromJson(String str) => _$NewsModelFromJson(json.decode(str));

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}
