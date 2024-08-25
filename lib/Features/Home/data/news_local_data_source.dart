import 'dart:developer';

import 'package:hive_flutter/adapters.dart';
import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

abstract class NewsLocalDataSource {
  List<NewsEntity> fetchAllNews({int pageNumber = 0});
  List<NewsEntity> fetchPolticsNews({int pageNumber = 0});
  List<NewsEntity> fetchSportsNews({int pageNumber = 0});
  List<NewsEntity> fetchBusinessNews({int pageNumber = 0});
  List<NewsEntity> fetchEntenainmentNews({int pageNumber = 0});
  List<NewsEntity> fetchScienceNews({int pageNumber = 0});
  List<NewsEntity> fetchTechonolgyNews({int pageNumber = 0});
  List<NewsEntity> fetchHealthNews({int pageNumber = 0});
}

class NewsLocalDataSourceImpl extends NewsLocalDataSource {
  @override
  List<NewsEntity> fetchAllNews({int pageNumber = 0}) {
    log("pageNumber length in local=$pageNumber");
    int startIndex = pageNumber * 30;
    log("Start Index in local= $startIndex");
    int endIndex = (pageNumber + 1) * 30;
    log("End Index in local= $endIndex");
    Box<NewsEntity> box = Hive.box<NewsEntity>(kAllNewsBox);
    int length = box.values.length;
    log("Length of Data in local= $length");
    if (startIndex >= length || endIndex > length) {
      // check out of range;
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchBusinessNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    Box<NewsEntity> box = Hive.box<NewsEntity>(kBusinessNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      //check out of range;
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchEntenainmentNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    Box<NewsEntity> box = Hive.box<NewsEntity>(kEnternainmentNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchHealthNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    Box<NewsEntity> box = Hive.box<NewsEntity>(kHealthNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchPolticsNews({int pageNumber = 0}) {
    log("pageNumber length in Poltics local=$pageNumber");
    int startIndex = pageNumber * 30;
    log("Start Index in Poltics local=$startIndex");
    int endIndex = (pageNumber + 1) * 30;
    log("End Index in Poltics local=$endIndex");
    Box<NewsEntity> box = Hive.box<NewsEntity>(kPloticsNewsBox);
    int length = box.values.length;
    log("length of newsData in Poltics local=$length");
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchScienceNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    Box<NewsEntity> box = Hive.box<NewsEntity>(kScienceNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchSportsNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    var box = Hive.box<NewsEntity>(kSportsNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<NewsEntity> fetchTechonolgyNews({int pageNumber = 0}) {
    int startIndex = pageNumber * 30;
    int endIndex = (pageNumber + 1) * 30;
    var box = Hive.box<NewsEntity>(kTechnologyNewsBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
