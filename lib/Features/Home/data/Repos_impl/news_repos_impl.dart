import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Core/Functions/get_news_data_impl.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import 'package:news_app/Features/Home/data/news_local_data_source.dart';
import 'package:news_app/Features/Home/data/news_remote_data_source.dart';

class NewsReposImpl extends NewsRepo {
  final NewsLocalDataSource localDataSource;
  final NewsRemoteDataSource remoteDataSource;

  NewsReposImpl(
      {required this.localDataSource, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
      context: context,
      newsRemoteDataSource:
          remoteDataSource.fetchAllNews(pageNumber: pageNumber),
      newsLocalDataSource: localDataSource.fetchAllNews(
          pageNumber: pageNumber == 1 ? 0 : pageNumber),
    );
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchBusinessNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
      context: context,
      newsRemoteDataSource:
          remoteDataSource.fetchBusinessNews(pageNumber: pageNumber),
      newsLocalDataSource: localDataSource.fetchBusinessNews(
          pageNumber: pageNumber == 1 ? 0 : pageNumber),
    );
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchEntenainmentNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
        context: context,
        newsRemoteDataSource:
            remoteDataSource.fetchEntenainmentNews(pageNumber: pageNumber),
        newsLocalDataSource: localDataSource.fetchEntenainmentNews(
            pageNumber: pageNumber == 1 ? 0 : pageNumber));
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchHealthNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
        context: context,
        newsLocalDataSource: localDataSource.fetchHealthNews(
            pageNumber: pageNumber == 1 ? 0 : pageNumber),
        newsRemoteDataSource:
            remoteDataSource.fetchHealthNews(pageNumber: pageNumber));
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchPolticsNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
      context: context,
      newsRemoteDataSource:
          remoteDataSource.fetchPolticsNews(pageNumber: pageNumber),
      newsLocalDataSource: localDataSource.fetchPolticsNews(
          pageNumber: pageNumber == 1 ? 0 : pageNumber),
    );
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchScienceNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
      context: context,
      newsRemoteDataSource:
          remoteDataSource.fetchScienceNews(pageNumber: pageNumber),
      newsLocalDataSource: localDataSource.fetchScienceNews(
          pageNumber: pageNumber == 1 ? 0 : pageNumber),
    );
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchSportsNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
        context: context,
        newsLocalDataSource: localDataSource.fetchSportsNews(
            pageNumber: pageNumber == 1 ? 0 : pageNumber),
        newsRemoteDataSource:
            remoteDataSource.fetchSportsNews(pageNumber: pageNumber));
  }

  @override
  Future<Either<Failure, List<NewsEntity>>> fetchTechonolgyNews(
      {int pageNumber = 1, required BuildContext context}) async {
    return await getNewsDataImpl(
        context: context,
        newsLocalDataSource: localDataSource.fetchTechonolgyNews(
            pageNumber: pageNumber == 1 ? 0 : pageNumber),
        newsRemoteDataSource:
            remoteDataSource.fetchTechonolgyNews(pageNumber: pageNumber));
  }
}
