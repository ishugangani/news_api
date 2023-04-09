import 'package:flutter/material.dart';
import 'package:news_api/screen/top_news/modal/news_modal.dart';
import 'package:news_api/utils/api/api_helper.dart';

class HomeProvider extends ChangeNotifier
{
  NewsModal? newsModal;
  // String tempcountry = "us";
  // String tempcategory = "business";
  //
  // void changeCountry(String country)
  // {
  //   tempcountry=country;
  //   notifyListeners();
  // }
  //
  // void changeCategory(String category)
  // {
  //   tempcategory=category;
  //   notifyListeners();
  // }

  Future<NewsModal?> callApi(String country,String category)
  async {
    ApiHelper ah = ApiHelper();
    newsModal = await ah.newsApi(country,category);
    return newsModal;
    notifyListeners();
  }
}