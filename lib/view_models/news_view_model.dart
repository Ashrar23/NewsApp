import 'package:flutter/material.dart';
import 'package:haber_app/locator.dart';
import 'package:haber_app/models/news.dart';
import 'package:haber_app/repository/NewsRepository.dart';

class NewsViewModel with ChangeNotifier {
  NewsRepository _repository = locator<NewsRepository>();
  News _getirilenHaber;

  News get getirilenHaber => _getirilenHaber;

  NewsViewModel() {
    _getirilenHaber = News();
  }
  Future<News> haberGetir() async {
    try {
      _getirilenHaber = await _repository.getNews();
    } catch (e) {
      print("Hata çıktı haberGetir()" + e.toString());
    }
    return _getirilenHaber;
  }
}
