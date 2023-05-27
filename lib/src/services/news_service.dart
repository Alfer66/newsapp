import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = '617c628c76424e26b37489340e078bd8';

class NewsService with ChangeNotifier {
  List<Article> headline = [];

  NewService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = '$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx';
    final resp = await http.get(url as Uri);

    final newsResponse = newsResponseFromJson(resp.body);

    this.headline.addAll(newsResponse.articles);
    notifyListeners();
  }
}
