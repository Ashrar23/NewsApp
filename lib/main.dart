import 'package:flutter/material.dart';
import 'package:haber_app/locator.dart';
import 'package:haber_app/view_models/news_view_model.dart';
import 'package:haber_app/widgets/news_page.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Haber Uygulaması",
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => locator<NewsViewModel>(),
        child: NewsPage(),
      ),
    );
  }
}
