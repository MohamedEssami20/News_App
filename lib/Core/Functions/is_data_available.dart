  import 'package:news_app/Features/Home/Domain/news_entity.dart';

bool isNewDataAvailable(List<NewsEntity> newNews, List<NewsEntity> currentNews) {
 if (newNews.isEmpty || currentNews.isEmpty) {
      return false;
      // is the first start of App;
      // return false;
    }

    // Check if the first news item in the new list is different from the current list
    for (int i = 0; i < newNews.length && i < currentNews.length; i++) {
      if (newNews[i].newsId != currentNews[i].newsId) {
        return true;
      }
    }
    // if condition is true will return true;
    return false;
  }