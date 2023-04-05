import 'package:flutter/material.dart';
import 'package:news_api/screen/top_news/modal/news_modal.dart';
import 'package:news_api/utils/api/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  NewsModal? NewsList;

  Future<void> callApi()
  async {
    ApiHelper ah = ApiHelper();
    NewsList = await ah.newsApi();
    notifyListeners();
  }
}