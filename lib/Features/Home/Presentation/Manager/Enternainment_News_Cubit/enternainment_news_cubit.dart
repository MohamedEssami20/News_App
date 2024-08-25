import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

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
}
