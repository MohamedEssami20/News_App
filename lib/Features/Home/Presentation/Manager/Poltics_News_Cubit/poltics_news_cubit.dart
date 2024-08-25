import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

part 'poltics_news_state.dart';

class PolticsCubit extends Cubit<PolticsNewsState> {
  PolticsCubit(this.newsRepo) : super(PolticsNewsInitial());

  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getPolticsNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(PolticsNewsLoading());
    } else {
      emit(PolticsNewsPaginationLoading());
    }
    Either<Failure, List<NewsEntity>> result = await newsRepo.fetchPolticsNews(
        context: context, pageNumber: pageNumber);

    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          PolticsNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          PolticsNewsPaginationFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);
        if (isNewsData) {
          // newsData.newsId != currentNews.newsId;
          // this is  a new data fetch;
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(PolticsNewsSuccess(newsData: currentNews));
        } else {
          // newsData.isEmpty or currentNews.isEmpty;
          // is first open app;
          // newsData.newsId == currentNews.newsId;
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            PolticsNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // pagination news data;
        currentNews.addAll(newsData);
        emit(
          PolticsNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }
}
