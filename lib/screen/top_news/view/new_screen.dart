import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  HomeProvider? HPTrue, HPFalse;

  Future<void> data() async {
    await Provider.of<HomeProvider>(context, listen: false).callApi();
  }

  @override
  void initState() {
    data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HPTrue = Provider.of<HomeProvider>(context, listen: true);
    HPFalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: HPTrue!.NewsList != null
            ? ListView.builder(
                itemCount: HPTrue!.NewsList!.articleList!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'news', arguments: index);
                    },
                    child: Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 2,color: Colors.black54)
                          ),
                          child: Column(
                            children: [
                              Image.network(
                                "${HPTrue!.NewsList!.articleList![index].urlToImage}",
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "${HPTrue!.NewsList!.articleList![index].author}",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "${HPTrue!.NewsList!.articleList![index].title}",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // child: ListTile(
                      //   leading: Image.network(
                      //     "${HPTrue!.NewsList!.articleList![index].urlToImage}",
                      //     height: 50,
                      //     width: 50,
                      //   ),
                      //   title: Text(
                      //     "${HPTrue!.NewsList!.articleList![index].title}",
                      //   ),
                      //   subtitle: Text(
                      //     "${HPTrue!.NewsList!.articleList![index].author}",
                      //   ),
                      //   trailing: Icon(Icons.arrow_forward),
                      // ),
                    ),
                  );
                },
              )
            : Container(),
        ),
      ),
    );
  }
}
