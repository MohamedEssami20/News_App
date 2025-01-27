  import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

List<NewsEntity> checkRangeofNewsList(int pageNumber, String boxName) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    Box<NewsEntity> box = Hive.box<NewsEntity>(boxName);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      //check out of range;
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }