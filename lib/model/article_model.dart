import 'package:news/model/source_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'].toString(),
      title: json['title'].toString(),
      description: json['description'].toString(),
      url: json['url'].toString(),
      urlToImage: json['urlToImage'].toString(),
      publishedAt: json['publishedAt'].toString(),
      content: json['content'].toString(),
    );
  }
}
