import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

part 'health_news_state.dart';

class HealthNewsCubit extends Cubit<HealthNewsState> {
  HealthNewsCubit(this.newsRepo) : super(HealthNewsInitial());
  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getHealthNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(
        HealthNewsLoading(),
      );
    } else {
      emit(
        HealthNewsPaginationLoading(),
      );
    }
    Either<Failure, List<NewsEntity>> result = await newsRepo.fetchHealthNews(
        context: context, pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          HealthNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          HealthNewsPaginationFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewData = isNewDataAvailable(newsData, currentNews);
        if (isNewData) {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            HealthNewsSuccess(newsData: currentNews),
          );
        } else {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            HealthNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // Pagination news data;
        currentNews.addAll(newsData);
        emit(
          HealthNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }
}
