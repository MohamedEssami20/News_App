import 'package:hive/hive.dart';
part 'news_entity.g.dart';

@HiveType(typeId: 0)
class NewsEntity extends HiveObject {
  @HiveField(0)
  final String newsTitle;
  @HiveField(1)
  final String newsDesc;
  @HiveField(2)
  final String newsImage;
  @HiveField(3)
  final String newsCatgorie;
  @HiveField(4)
  final String newsauthor;
  @HiveField(5)
  final String newsTime;
  @HiveField(6)
  final String newsUrl;
  @HiveField(7)
  final String newsId;

  NewsEntity({
    required this.newsTitle,
    required this.newsDesc,
    required this.newsImage,
    required this.newsCatgorie,
    required this.newsTime,
    required this.newsauthor,
    required this.newsUrl,
    required this.newsId,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsEntity && other.newsId == newsId;
  }

  @override
  int get hashCode => newsId.hashCode;
}
