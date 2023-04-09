import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/home_provider.dart';
import 'package:news_api/screen/top_news/modal/news_modal.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  HomeProvider? HPTrue, HPFalse;

  Future<void> data() async {
    await Provider.of<HomeProvider>(context, listen: false).newsModal;
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "USA",
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "INDIA",
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "KOREA",
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "CHINA",
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "UK",
                  ),
                ),
              ],
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if(snapshot.hasError)
                      {
                        return Text("${snapshot.error}");
                      }
                    else if(snapshot.hasData)
                      {
                        NewsModal? newsModal = snapshot.data as NewsModal?;
                        List<Article> articleList= newsModal!.articles;

                        return ListView.builder(
                          itemCount: articleList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                "${articleList[index].urlToImage}",
                                fit: BoxFit.contain,
                                height: 70,
                                width: 100,
                              ),
                              title: Text("${articleList[index].title}"),
                              subtitle: Text("${articleList[index].author}"),
                            );
                          },
                        );
                      }
                    return Center(
                      child: Container(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                  future: HPFalse!.callApi("us","business"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//   child: Padding(
//     padding: const EdgeInsets.all(5),
//     child: ListTile(
//       leading: Image.network(
//         "${HPTrue!.NewsList!.articles[index].urlToImage}",
//         fit: BoxFit.contain,
//         height: 70,
//         width: 100,
//       ),
//     ),
//   ),
// ),
