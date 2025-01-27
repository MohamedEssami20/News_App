
import 'package:news_app/Core/Constant/variable.dart';
import 'package:news_app/Features/Home/Domain/news_entity.dart';
import '../../../Core/Functions/check_range_of_news_list.dart';

abstract class NewsLocalDataSource {
  List<NewsEntity> fetchAllNews({int pageNumber = 0});
  List<NewsEntity> fetchPolticsNews({int pageNumber = 0});
  List<NewsEntity> fetchSportsNews({int pageNumber = 0});
  List<NewsEntity> fetchBusinessNews({int pageNumber = 0});
  List<NewsEntity> fetchEntenainmentNews({int pageNumber = 0});
  List<NewsEntity> fetchScienceNews({int pageNumber = 0});
  List<NewsEntity> fetchTechonolgyNews({int pageNumber = 0});
  List<NewsEntity> fetchHealthNews({int pageNumber = 0});
}

class NewsLocalDataSourceImpl extends NewsLocalDataSource {
  @override
  List<NewsEntity> fetchAllNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kAllNewsBox);
  }

  @override
  List<NewsEntity> fetchBusinessNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kBusinessNewsBox);
  }

  @override
  List<NewsEntity> fetchEntenainmentNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kEnternainmentNewsBox);
  }

  @override
  List<NewsEntity> fetchHealthNews({int pageNumber = 0}) {
   return checkRangeofNewsList(pageNumber,kHealthNewsBox);
  }

  @override
  List<NewsEntity> fetchPolticsNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kPloticsNewsBox);
  }

  @override
  List<NewsEntity> fetchScienceNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kScienceNewsBox);
  }

  @override
  List<NewsEntity> fetchSportsNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kSportsNewsBox);
  }

  @override
  List<NewsEntity> fetchTechonolgyNews({int pageNumber = 0}) {
    return checkRangeofNewsList(pageNumber,kTechnologyNewsBox);
  }
}
