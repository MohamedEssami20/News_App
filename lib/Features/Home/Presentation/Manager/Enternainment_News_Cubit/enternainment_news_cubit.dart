import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

import '../../../../../Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import '../../../../../Core/Utils/Widgets/error_snack_bar.dart';

part 'enternainment_news_state.dart';

class EnternainmentNewsCubit extends Cubit<EnternainmentNewsState> {
  EnternainmentNewsCubit(this.newsRepo) : super(EnternainmentNewsInitial());
  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getEnternainmentNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(
        EnternainmentNewsLoading(),
      );
    } else {
      emit(
        EnternainmentNewsPaginationLoading(),
      );
    }

    Either<Failure, List<NewsEntity>> result = await newsRepo
        .fetchEntenainmentNews(context: context, pageNumber: pageNumber);

    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          EnternainmentNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          EnternainmentNewsPaginationFailure(
              errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);

        if (isNewsData) {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            EnternainmentNewsSuccess(newsData: currentNews),
          );
        } else {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            EnternainmentNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // Pagination news Data;
        currentNews.addAll(newsData);
        emit(
          EnternainmentNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }

  Future<void> refreshEnterainmentPage(BuildContext context, bool mounted) async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final internetConnected = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnected is InternetConncetionSuccess;
    if (isInternetConnected) {
      await getEnternainmentNews(context:context, pageNumber: 1);
    } else {
      if (mounted) {
        showErrorSnackbar(context,
            "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }
}
