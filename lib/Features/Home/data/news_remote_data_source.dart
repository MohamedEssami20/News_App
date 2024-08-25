import 'dart:developer';

import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Core/Functions/add_news_data.dart';
import 'package:news_app/Core/Service/api_service.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchPolticsNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchSportsNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchBusinessNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchEntenainmentNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchScienceNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchTechonolgyNews({int pageNumber = 1});
  Future<List<NewsEntity>> fetchHealthNews({int pageNumber = 1});
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final ApiService apiService;

  NewsRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<NewsEntity>> fetchBusinessNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=business&language=en&page_number=$pageNumber");
    return addNewsData(result, kBusinessNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchEntenainmentNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints:
            "&category=enternainment&language=en&page_number=$pageNumber");
    return addNewsData(result, kEnternainmentNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchHealthNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=health&language=en&page_number=$pageNumber");
    return addNewsData(result, kHealthNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchPolticsNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=poltics&language=ar&page_number=$pageNumber");
    log("page number in poltics= $pageNumber");
    return addNewsData(result, kPloticsNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchScienceNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=science&language=en&page_number=$pageNumber");
    return addNewsData(result, kScienceNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchSportsNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=sports&language=en&page_number=$pageNumber");
    return addNewsData(result, kSportsNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchTechonolgyNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=technology&language=en&page_number=$pageNumber");
    return addNewsData(result, kTechnologyNewsBox);
  }

  @override
  Future<List<NewsEntity>> fetchAllNews({int pageNumber = 0}) async {
    Map<String, dynamic> result = await apiService.get(
        endPoints: "&category=all&language=ar&page_number=$pageNumber");
    log("page number in remote= $pageNumber");
    return addNewsData(result, kAllNewsBox);
  }
}
