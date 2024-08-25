import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

part 'bussiness_news_state.dart';

class BussinessNewsCubit extends Cubit<BussinessNewsState> {
  BussinessNewsCubit(this.newsRepo) : super(BussinessNewsInitial());

  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getBussinessNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(
        BussinessNewsLoading(),
      );
    } else {
      emit(
        BussinessNewsPaginationLoading(),
      );
    }
    Either<Failure, List<NewsEntity>> result = await newsRepo.fetchBusinessNews(
        context: context, pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          BussinessNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          BussinessNewsPaginationfailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);

        if (isNewsData) {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            BussinessNewsSuccess(newsData: currentNews),
          );
        } else {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            BussinessNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // Pagination news Data;
        currentNews.addAll(newsData);
        emit(
          BussinessNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }
}
