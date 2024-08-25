part of 'health_news_cubit.dart';

@immutable
sealed class HealthNewsState {}

final class HealthNewsInitial extends HealthNewsState {}

final class HealthNewsLoading extends HealthNewsState {}

final class HealthNewsSuccess extends HealthNewsState {
  final List<NewsEntity> newsData;

  HealthNewsSuccess({required this.newsData});
}

final class HealthNewsFailure extends HealthNewsState {
  final String errorMessage;

  HealthNewsFailure({required this.errorMessage});
}

final class HealthNewsPaginationLoading extends HealthNewsState {}

final class HealthNewsPaginationSuccess extends HealthNewsState {
  final List<NewsEntity> newsData;

  HealthNewsPaginationSuccess({required this.newsData});
}

final class HealthNewsPaginationFailure extends HealthNewsState {
  final String errorMessage;

  HealthNewsPaginationFailure({required this.errorMessage});
}
