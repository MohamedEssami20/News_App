import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

Future<Either<Failure, List<NewsEntity>>> getNewsDataImpl(
    {required BuildContext context,
    required Future<List<NewsEntity>> newsRemoteDataSource,
    required List<NewsEntity> newsLocalDataSource}) async {
  final internetConnection = context.read<InternetConncetionCubit>().state;
  List<NewsEntity> newsData;
  if (internetConnection is InternetConncetionInitial ||
      internetConnection is InternetConncetionSuccess) {
    try {
      newsData = await newsRemoteDataSource;
      return right(newsData);
    } on Exception catch (error) {
      if (error is DioException) {
        newsData = newsLocalDataSource;
        if (newsData.isNotEmpty) {
          return right(newsData);
        } else {
          return left(
            ServerFailure.fromDioExcption(error),
          );
        }
      } else {
        return left(
          ServerFailure(
            errorMessage: error.toString(),
          ),
        );
      }
    }
  } else {
    newsData = newsLocalDataSource;
    return right(newsData);
  }
}
