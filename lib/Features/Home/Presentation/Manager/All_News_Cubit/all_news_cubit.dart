import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.newsRepos) : super(AllNewsCubitInitial());
  final NewsRepo newsRepos;
  final List<NewsEntity> currentNews = [];

  Future<void> getAllNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(AllNewsLoading());
    } else {
      emit(AllNewsPaginationLoading());
    }

    Either<Failure, List<NewsEntity>> allNews =
        await newsRepos.fetchAllNews(pageNumber: pageNumber, context: context);

    allNews.fold((failure) {
      if (pageNumber == 1) {
        emit(AllNewsFailure(errorMessage: failure.errorMessage));
      } else {
        emit(AllNewsPaginationFailure(errorMessage: failure.errorMessage));
      }
    }, (newNews) {
      log("**** All News In Cubit=  ${newNews.length}");

      if (pageNumber == 1) {
        // Check if new news are different from current news
        final bool isNewData = isNewDataAvailable(newNews, currentNews);

        if (isNewData) {
          // if true;
          // newsData[0].newsId != currentNews[0].newsId;
          currentNews.clear(); // Clear old data only if there is new data
          currentNews.addAll(newNews);
          log("**** Updated Current News In Cubit=  ${currentNews.length}");
          emit(AllNewsSuccess(allNews: currentNews)); // fetch new news data;
        } else {
          //is false;
          // is first open app;
          // newsData[0].newsId == currentNews[0].newsId;
          currentNews.clear();
          currentNews.addAll(newNews);
          emit(AllNewsSuccess(allNews: currentNews)); // fetch same old data;
        }
      } else {
        // For pagination, just append new data
        currentNews
            .addAll(newNews); // add news data to currentNews from pagination;
        emit(
          AllNewsPaginationSuccess(newsData: newNews),
        );
      }
    });
  }
}
