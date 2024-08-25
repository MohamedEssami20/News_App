import 'package:news_app/Features/Home/Domain/news_entity.dart';

class NewsModel extends NewsEntity {
  String? id;
  String? title;
  String? description;
  String? url;
  String? author;
  String? image;
  String? language;
  List<String>? category;
  String? published;

  NewsModel({
    this.id,
    this.title,
    this.description,
    this.url,
    this.author,
    this.image,
    this.language,
    this.category,
    this.published,
  }) : super(
            newsTitle: title??"UnKnown",
            newsDesc: description??"UnKnown",
            newsCatgorie: category!.isEmpty?"unKnown":category[0],
            newsImage: image??"UnKnown",
            newsTime: published??"UnKnown",
            newsauthor: author??"UnKnown",
            newsUrl: url??"",
            newsId:id??"",
            );

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json['id'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        author: json['author'] as String?,
        image: json['image'] as String?,
        language: json['language'] as String?,
        category:(json['category'] as List<dynamic>?)?.map((category) =>category.toString()).toList(),
        published: json['published'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'url': url,
        'author': author,
        'image': image,
        'language': language,
        'category': category,
        'published': published,
      };
}
