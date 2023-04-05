import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  HomeProvider? HPTrue,HPFalse;

  @override
  Widget build(BuildContext context) {

    HPFalse=Provider.of<HomeProvider>(context,listen: false);
    HPTrue=Provider.of<HomeProvider>(context,listen: true);
    int index=ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("24/7 News"),
          actions: [
            Icon(Icons.menu),
            SizedBox(width: 15,),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(
                  "${HPTrue!.NewsList!.articleList![index].urlToImage}",
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${HPTrue!.NewsList!.articleList![index].source!.name}"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.NewsList!.articleList![index].title}",
                        style: TextStyle(fontSize: 20,),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.NewsList!.articleList![index].description}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffA7BBC7),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${HPTrue!.NewsList!.articleList![index].publishedAt} | ${HPTrue!.NewsList!.articleList![index].author}",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xffE1E5EA),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("--------------------------------------------------------------------------------------",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${HPTrue!.NewsList!.articleList![index].content}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
