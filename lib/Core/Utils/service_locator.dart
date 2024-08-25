import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/Core/Service/api_service.dart';
import 'package:news_app/Features/Home/data/Repos_impl/news_repos_impl.dart';
import 'package:news_app/Features/Home/data/news_local_data_source.dart';
import 'package:news_app/Features/Home/data/news_remote_data_source.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton<NewsReposImpl>(
    NewsReposImpl(
      localDataSource: NewsLocalDataSourceImpl(),
      remoteDataSource:
          NewsRemoteDataSourceImpl(apiService: getIt.get<ApiService>()),
    ),
  );
}
