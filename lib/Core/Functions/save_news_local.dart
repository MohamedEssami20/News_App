import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

Future<void> saveNewsLocal(
    {required List<NewsEntity> newsData, required String boxNAme}) async {
  Box<NewsEntity> box = Hive.box<NewsEntity>(boxNAme);
  if (box.isNotEmpty) {
    box.clear();
    await box.addAll(newsData);
    log("news Lenght in box at save= ${box.values.length}");
  } else {
    await box.addAll(newsData);
    log("news Lenght in box at save= ${box.values.length}");
  }
}
