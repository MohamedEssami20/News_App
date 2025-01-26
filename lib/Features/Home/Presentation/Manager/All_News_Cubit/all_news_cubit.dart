import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

import '../../../../../Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import '../../../../../Core/Utils/Widgets/error_snack_bar.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit(this.newsRepos) : super(AllNewsCubitInitial());
  final NewsRepo newsRepos;
  final List<NewsEntity> currentNews = [];
  //create method that get all news
  Future<void> getAllNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(AllNewsLoading());
    } else {
      emit(AllNewsPaginationLoading());
    } // emit loading news in first page or loading more news in pagination;

    Either<Failure, List<NewsEntity>> allNews =
        await newsRepos.fetchAllNews(pageNumber: pageNumber, context: context);

    allNews.fold((failure) {
      if (pageNumber == 1) {
        emit(AllNewsFailure(errorMessage: failure.errorMessage));
      } else {
        emit(AllNewsPaginationFailure(errorMessage: failure.errorMessage));
      } //emit news failure in first page or news pagination;
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
          emit(AllNewsSuccess(
              allNews: currentNews)); // fetch new news data in refresh;
        } else {
          //is false;
          // is first open app;
          // newsData[0].newsId == currentNews[0].newsId;
          currentNews.clear();
          currentNews.addAll(newNews);
          emit(AllNewsSuccess(allNews: currentNews)); // fetch same old data;
        }
      } else {
        // page number >1
        // For pagination, just append new data
        currentNews
            .addAll(newNews); // add news data to currentNews from pagination;
        emit(
          AllNewsPaginationSuccess(newsData: newNews),
        );
      }
    });
  }

  Future<void> refreshAllNewsPage(BuildContext context, bool mounted) async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final internetConnected = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnected is InternetConncetionSuccess;
    if (isInternetConnected) {
      await getAllNews(context: context, pageNumber: 1);
    } else {
      if (mounted) {
        showErrorSnackbar(
            context, "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }
}
