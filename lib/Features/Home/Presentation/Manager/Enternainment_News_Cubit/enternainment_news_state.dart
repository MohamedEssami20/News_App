part of 'enternainment_news_cubit.dart';

@immutable
sealed class EnternainmentNewsState {}

final class EnternainmentNewsInitial extends EnternainmentNewsState {}

final class EnternainmentNewsLoading extends EnternainmentNewsState {}

final class EnternainmentNewsSuccess extends EnternainmentNewsState {
  final List<NewsEntity> newsData;

  EnternainmentNewsSuccess({required this.newsData});
}

final class EnternainmentNewsFailure extends EnternainmentNewsState {
  final String errorMessage;

  EnternainmentNewsFailure({required this.errorMessage});
}

final class EnternainmentNewsPaginationLoading extends EnternainmentNewsState {}

final class EnternainmentNewsPaginationSuccess extends EnternainmentNewsState {
  final List<NewsEntity> newsData;

  EnternainmentNewsPaginationSuccess({required this.newsData});
}

final class EnternainmentNewsPaginationFailure extends EnternainmentNewsState {
  final String errorMessage;

  EnternainmentNewsPaginationFailure({required this.errorMessage});
}
