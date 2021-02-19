import 'package:get_it/get_it.dart';
import 'package:haber_app/api/news_api_client.dart';
import 'package:haber_app/repository/NewsRepository.dart';
import 'package:haber_app/view_models/news_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NewsRepository());
  locator.registerLazySingleton(() => NewsApiClient());
  locator.registerFactory(() => NewsViewModel());
}
