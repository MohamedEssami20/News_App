import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

abstract class NewsRepo {
  // function to fetch All news;
  Future<Either<Failure, List<NewsEntity>>> fetchAllNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch Plotics news;
  Future<Either<Failure, List<NewsEntity>>> fetchPolticsNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch sports news;
  Future<Either<Failure, List<NewsEntity>>> fetchSportsNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch business news;
  Future<Either<Failure, List<NewsEntity>>> fetchBusinessNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch enternainment news;
  Future<Either<Failure, List<NewsEntity>>> fetchEntenainmentNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch science news;
  Future<Either<Failure, List<NewsEntity>>> fetchScienceNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch technology news;
  Future<Either<Failure, List<NewsEntity>>> fetchTechonolgyNews(
      {int pageNumber = 0, required BuildContext context});
  // function to fetch health news;
  Future<Either<Failure, List<NewsEntity>>> fetchHealthNews(
      {int pageNumber = 0, required BuildContext context});
}
