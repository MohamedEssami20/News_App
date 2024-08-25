part of 'poltics_news_cubit.dart';

@immutable
sealed class PolticsNewsState {}

final class PolticsNewsInitial extends PolticsNewsState {}

final class PolticsNewsSuccess extends PolticsNewsState {
  final List<NewsEntity> newsData;

  PolticsNewsSuccess({required this.newsData});
}

final class PolticsNewsFailure extends PolticsNewsState {
  final String errorMessage;

  PolticsNewsFailure({required this.errorMessage});
}

final class PolticsNewsLoading extends PolticsNewsState {}

final class PolticsNewsPaginationLoading extends PolticsNewsState {}

final class PolticsNewsPaginationSuccess extends PolticsNewsState {
  final List<NewsEntity> newsData;

  PolticsNewsPaginationSuccess({required this.newsData});
}

final class PolticsNewsPaginationFailure extends PolticsNewsState {
  final String errorMessage;

  PolticsNewsPaginationFailure({required this.errorMessage});
}
