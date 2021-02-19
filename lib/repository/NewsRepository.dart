import 'package:haber_app/api/news_api_client.dart';
import 'package:haber_app/locator.dart';
import 'package:haber_app/models/news.dart';

class NewsRepository {
  NewsApiClient newsApiClient = locator<NewsApiClient>();
  Future<News> getNews() async {
    return await newsApiClient.getNews();
  }
}
