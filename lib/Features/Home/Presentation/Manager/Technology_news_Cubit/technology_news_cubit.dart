import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Core/Functions/is_data_available.dart';
import 'package:news_app/Core/Utils/failure.dart';
import 'package:news_app/Features/Home/Domain/Repos/news_repo.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';

part 'technology_news_state.dart';

class TechnologyNewsCubit extends Cubit<TechnologyNewsState> {
  TechnologyNewsCubit(this.newsRepo) : super(TechnologyNewsInitial());

  final NewsRepo newsRepo;
  final List<NewsEntity> currentNews = [];
  Future<void> getTechnologyNews(
      {int pageNumber = 1, required BuildContext context}) async {
    if (pageNumber == 1) {
      emit(
        TechnologyNewsLoading(),
      );
    } else {
      emit(
        TechnologyNewsPaginationLoading(),
      );
    }
    Either<Failure, List<NewsEntity>> result = await newsRepo
        .fetchTechonolgyNews(context: context, pageNumber: pageNumber);
    result.fold((failure) {
      if (pageNumber == 1) {
        emit(
          TechnologyNewsFailure(errorMessage: failure.errorMessage),
        );
      } else {
        emit(
          TechnologyNewsPaginationFailure(errorMessage: failure.errorMessage),
        );
      }
    }, (newsData) {
      if (pageNumber == 1) {
        final bool isNewsData = isNewDataAvailable(newsData, currentNews);
        if (isNewsData) {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            TechnologyNewsSuccess(newsData: currentNews),
          );
        } else {
          currentNews.clear();
          currentNews.addAll(newsData);
          emit(
            TechnologyNewsSuccess(newsData: currentNews),
          );
        }
      } else {
        // pagination news data;
        currentNews.addAll(newsData);
        emit(
          TechnologyNewsPaginationSuccess(newsData: newsData),
        );
      }
    });
  }
}
