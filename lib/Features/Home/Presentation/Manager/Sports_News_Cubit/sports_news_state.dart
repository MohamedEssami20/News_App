part of 'sports_news_cubit.dart';

@immutable
sealed class SportsNewsState {}

final class SportsNewsInitial extends SportsNewsState {}

final class SportsNewsLoading extends SportsNewsState {}

final class SportsNewsSuccess extends SportsNewsState {
  final List<NewsEntity> newsData;

  SportsNewsSuccess({required this.newsData});
}

final class SportsNewsFailure extends SportsNewsState {
  final String errorMessage;

  SportsNewsFailure({required this.errorMessage});
}

final class SportsNewsPaginationLoading extends SportsNewsState {}

final class SportsNewsPaginationSuccess extends SportsNewsState {
  final List<NewsEntity> newsData;

  SportsNewsPaginationSuccess({required this.newsData});
}

final class SportsNewsPaginationFailure extends SportsNewsState {
  final String errorMessage;

  SportsNewsPaginationFailure({required this.errorMessage});
}
