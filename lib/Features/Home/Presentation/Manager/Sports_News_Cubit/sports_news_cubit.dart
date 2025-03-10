import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

import '../../../../../Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import '../../../../../Core/Utils/Widgets/error_snack_bar.dart';

part 'sports_news_state.dart';

class SportsNewsCubit extends Cubit<SportsNewsState> {
  SportsNewsCubit(this.newsRepo) : super(SportsNewsInitial());
  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  int nextPage = 1;
  Future<void> getSportsNews({
    int pageNumber = 1,
    required BuildContext context,
  }) async {
    if (pageNumber == 1) {
      emit(
        SportsNewsLoading(),
      );
    } else {
      emit(
        SportsNewsPaginationLoading(),
      );
    }

    Either<Failure, List<NewsEntity>> results = await newsRepo.fetchSportsNews(
        context: context, pageNumber: pageNumber);
    results.fold((failure) {
      if (pageNumber == 1) {
        emit(
          SportsNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          SportsNewsFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);
        if (isNewsData) {
          // Check if new news are different from current news;
          // newsData.newsId!=currentNews.newsId;
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            SportsNewsSuccess(newsData: currentNews),
          );
        } else {
          // newsData.newsId==currentNews.newsId;
          // newsData.isEmpty Or currentNews.isEmpty;
          // is first open app;
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            SportsNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // Pagination news data;
        currentNews.addAll(newsData);
        emit(
          SportsNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }

  Future<void> refreshSportsPage(BuildContext context, bool mounted) async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final internetConnected = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnected is InternetConncetionSuccess;
    if (isInternetConnected) {
      await getSportsNews(context:context, pageNumber: 1);
      nextPage = 1;
    } else {
      if (mounted) {
        showErrorSnackbar(context,
            "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }
}
