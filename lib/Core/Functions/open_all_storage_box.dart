import 'package:hive/hive.dart';
import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

Future<void> openAllStorgeBox() async {
  await Hive.openBox<NewsEntity>(kAllNewsBox);
  await Hive.openBox<NewsEntity>(kPloticsNewsBox);
  await Hive.openBox<NewsEntity>(kSportsNewsBox);
  await Hive.openBox<NewsEntity>(kBusinessNewsBox);
  await Hive.openBox<NewsEntity>(kEnternainmentNewsBox);
  await Hive.openBox<NewsEntity>(kScienceNewsBox);
  await Hive.openBox<NewsEntity>(kTechnologyNewsBox);
  await Hive.openBox<NewsEntity>(kHealthNewsBox);
}