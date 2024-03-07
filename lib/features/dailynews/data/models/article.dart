import 'package:bloc_newsapp_complete/core/constants/constants.dart';
import 'package:bloc_newsapp_complete/features/dailynews/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] != null && json['urlToImage'] != ""
          ? json['urlToImage']
          : kDefaultImage,
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "",
    );
  }
}
