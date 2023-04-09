import 'package:flutter/material.dart';
import 'package:news_api/screen/top_news/view/new_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: Text("24/7 News"),
            actions: [
              Icon(Icons.menu),
              SizedBox(width: 15,),
            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  text: "BUSINESS",
                ),
                Tab(
                  text: "POLITICS",
                ),
                Tab(
                  text: "HEALTH",
                ),
                Tab(
                  text: "EDUCATION",
                ),
                Tab(
                  text: "TECHNOLOGY",
                ),
                Tab(
                  text: "SPORTS",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
              NewsScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black54,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video_outlined),label: "Video"),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}
