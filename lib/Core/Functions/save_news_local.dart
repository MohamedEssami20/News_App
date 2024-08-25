import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

Future<void> saveNewsLocal(
    {required List<NewsEntity> newsData, required String boxNAme}) async{
  Box<NewsEntity> box = Hive.box<NewsEntity>(boxNAme);
   await box.addAll(newsData);
}
