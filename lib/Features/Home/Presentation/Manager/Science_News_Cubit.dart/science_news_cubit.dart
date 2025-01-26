import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

import '../../../../../Core/Manager/Internet_connectio_Cubit/internet_conncetion_cubit.dart';
import '../../../../../Core/Utils/Widgets/error_snack_bar.dart';

part 'science_news_state.dart';

class ScienceNewsCubit extends Cubit<ScienceNewsState> {
  ScienceNewsCubit(this.newsRepo) : super(ScienceNewsInitial());

  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getScienceNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(
        ScienceNewsLoading(),
      );
    } else {
      emit(
        ScienceNewsPaginationLoading(),
      );
    }

    Either<Failure, List<NewsEntity>> result = await newsRepo.fetchScienceNews(
        context: context, pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          ScienceNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          ScienceNewsPaginationFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);

        if (isNewsData) {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            ScienceNewsSuccess(newsData: currentNews),
          );
        } else {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            ScienceNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        //Pagination news data;
        currentNews.addAll(newsData);
        emit(
          ScienceNewsPaginationSuccess(newsData: newsData),
        ); 
      }
    });
  }

  Future<void> refreshSciencePage(BuildContext context, bool mounted) async {
    if (!mounted) return;
    await Future.delayed(const Duration(seconds: 2));
    final internetConnected = context.read<InternetConncetionCubit>().state;
    final isInternetConnected = internetConnected is InternetConncetionSuccess;
    if (isInternetConnected) {
      await getScienceNews(context:context, pageNumber: 1);
    } else {
      if (mounted) {
        showErrorSnackbar(context,
            "Internet Connection Failed", Icons.wifi_off);
      }
    }
  }
}
