import 'dart:developer';

import 'package:news_app/Core/Functions/save_news_local.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/data/Models/news_model.dart';

List<NewsEntity> addNewsData(Map<String, dynamic> result, String boxName) {
  List<NewsEntity> newsData = [];
  for (var element in result["news"]) {
    newsData.add(NewsModel.fromJson(element));
  }
  log("News Data when get from api= ${newsData.length}");
  saveNewsLocal(newsData: newsData, boxNAme: boxName);
  return newsData;
}
