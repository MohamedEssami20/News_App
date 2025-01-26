import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

import '../../../../../Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import '../../../../../Core/Utils/Widgets/error_snack_bar.dart';

part 'poltics_news_state.dart';

class PolticsCubit extends Cubit<PolticsNewsState> {
  PolticsCubit(this.newsRepo) : super(PolticsNewsInitial());

  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  int nextPage = 1;
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

  Future<void> refreshPolticsPage(BuildContext context, bool mounted) async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final internetConnected = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnected is InternetConncetionSuccess;
    if (isInternetConnected) {
      await getPolticsNews(context:context, pageNumber: 1);
      nextPage = 1;
    } else {
      if (mounted) {
        showErrorSnackbar(context,
            "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }
}
