import 'package:http/http.dart' as http;
import 'article.dart';
import 'dart:convert';

class News {
  List<Article> news = [];
  // ignore: non_constant_identifier_names
  String api_key = '57679312875d45659fe15a0f1a275fa1';
  String headline = 'top-headlines';

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/$headline?country=us&category=business&apiKey=$api_key';

    var respone = await http.get(url);

    var jsonData = jsonDecode(respone.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null) {
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element['content'],
            publishedAt: DateTime.parse(element['publishedAt']),
          );
          news.add(article);
        }
      });
    }
  }
}
