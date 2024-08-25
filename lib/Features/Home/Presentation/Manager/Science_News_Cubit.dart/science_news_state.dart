part of 'science_news_cubit.dart';

@immutable
sealed class ScienceNewsState {}

final class ScienceNewsInitial extends ScienceNewsState {}

final class ScienceNewsLoading extends ScienceNewsState {}

final class ScienceNewsSuccess extends ScienceNewsState {
  final List<NewsEntity> newsData;

  ScienceNewsSuccess({required this.newsData});
}

final class ScienceNewsFailure extends ScienceNewsState {
  final String errorMessage;

  ScienceNewsFailure({required this.errorMessage});
}

final class ScienceNewsPaginationLoading extends ScienceNewsState {}

final class ScienceNewsPaginationSuccess extends ScienceNewsState {
  final List<NewsEntity> newsData;

  ScienceNewsPaginationSuccess({required this.newsData});
}

final class ScienceNewsPaginationFailure extends ScienceNewsState {
  final String errorMessage;

  ScienceNewsPaginationFailure({required this.errorMessage});
}
