part of 'bussiness_news_cubit.dart';

@immutable
sealed class BussinessNewsState {}

final class BussinessNewsInitial extends BussinessNewsState {}

final class BussinessNewsLoading extends BussinessNewsState {}

final class BussinessNewsSuccess extends BussinessNewsState {
  final List<NewsEntity> newsData;

  BussinessNewsSuccess({required this.newsData});
}

final class BussinessNewsFailure extends BussinessNewsState {
  final String errorMessage;

  BussinessNewsFailure({required this.errorMessage});
}

final class BussinessNewsPaginationLoading extends BussinessNewsState {}

final class BussinessNewsPaginationSuccess extends BussinessNewsState {
  final List<NewsEntity> newsData;

  BussinessNewsPaginationSuccess({required this.newsData});
}

final class BussinessNewsPaginationfailure extends BussinessNewsState {
  final String errorMessage;

  BussinessNewsPaginationfailure({required this.errorMessage});
}
