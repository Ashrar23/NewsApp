import 'dart:convert';

import 'package:haber_app/models/news.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  Future<News> getNews() async {
    final http.Client httpClient = http.Client();
    final url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=add7f326d1ff4a689d0e15fc5317ba2d";
    final gelenCevap = await httpClient.get(url);

    if (gelenCevap.statusCode != 200) {
      throw Exception("Haberler getirilemedi");
    }
    final gelenCevapJson = jsonDecode(gelenCevap.body);
    return News.fromJson(gelenCevapJson);
  }
}
