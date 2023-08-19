

import 'SourceModel.dart';

part 'ArticalModel.g.dart';


class Article {
  Article(this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content);

  String? author, description, urlToImage, content;
  String title, url, publishedAt;
  Source source;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

}
