import 'package:flutter/material.dart';
import 'package:haber_app/models/news.dart';
import 'package:haber_app/view_models/news_view_model.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  NewsViewModel _newsViewModel;

  List<Article> articles = [];

  @override
  Widget build(BuildContext context) {
    _newsViewModel = Provider.of<NewsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Haberler"),
      ),
      body: FutureBuilder(
        future: haberGetir(),
        builder: (context, snapshot) {
          if (articles.isNotEmpty) {
            return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Image.network(articles[index].urlToImage),
                        ListTile(
                          leading: Icon(Icons.arrow_drop_down_circle),
                          title: Text(articles[index].title),
                          subtitle: Text(articles[index].author),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(articles[index].description),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> haberGetir() async {
    await _newsViewModel.haberGetir();
    print("haberler getirildi. " + _newsViewModel.getirilenHaber.status);
    articles = _newsViewModel.getirilenHaber.articles;
  }
}
