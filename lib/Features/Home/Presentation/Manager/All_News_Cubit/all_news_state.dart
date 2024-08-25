part of 'all_news_cubit.dart';

@immutable
sealed class AllNewsState {}

final class AllNewsCubitInitial extends AllNewsState {}

final class AllNewsLoading extends AllNewsState {}

final class AllNewsSuccess extends AllNewsState {
  final List<NewsEntity> allNews;

  AllNewsSuccess({required this.allNews});
}

final class AllNewsFailure extends AllNewsState {
  final String errorMessage;

  AllNewsFailure({required this.errorMessage});
}

final class AllNewsPaginationFailure extends AllNewsState {
  final String errorMessage;

  AllNewsPaginationFailure({required this.errorMessage});
}

final class AllNewsPaginationLoading extends AllNewsState {}

final class AllNewsPaginationSuccess extends AllNewsState {
  final List<NewsEntity> newsData;

  AllNewsPaginationSuccess({required this.newsData});
}
