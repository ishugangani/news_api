import 'package:flutter/material.dart';
import 'package:news_api/screen/details/view/detail_screen.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:news_api/screen/home/view/home_screen.dart';
import 'package:news_api/screen/top_news/view/new_screen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => HomeScreen(),
          'news':(context) => DetailScreen(),
        },
      ),
    ),
  );
}