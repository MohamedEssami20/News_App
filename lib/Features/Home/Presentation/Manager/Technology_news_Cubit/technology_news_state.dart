part of 'technology_news_cubit.dart';

@immutable
sealed class TechnologyNewsState {}

final class TechnologyNewsInitial extends TechnologyNewsState {}

final class TechnologyNewsLoading extends TechnologyNewsState {}

final class TechnologyNewsSuccess extends TechnologyNewsState {
  final List<NewsEntity> newsData;

  TechnologyNewsSuccess({required this.newsData});
}

final class TechnologyNewsFailure extends TechnologyNewsState {
  final String errorMessage;

  TechnologyNewsFailure({required this.errorMessage});
}

final class TechnologyNewsPaginationLoading extends TechnologyNewsState {}

final class TechnologyNewsPaginationSuccess extends TechnologyNewsState {
  final List<NewsEntity> newsData;

  TechnologyNewsPaginationSuccess({required this.newsData});
}

final class TechnologyNewsPaginationFailure extends TechnologyNewsState {
  final String errorMessage;

  TechnologyNewsPaginationFailure({required this.errorMessage});
}
