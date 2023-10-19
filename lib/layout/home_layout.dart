import 'package:flutter/material.dart';
import 'package:movie_app/screens/browse_taps.dart';
import 'package:movie_app/screens/home_taps.dart';
import 'package:movie_app/screens/search_tap.dart';
import 'package:movie_app/screens/watch_list.dart';
import 'package:movie_app/themes/mytheme.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> taps = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MyThemeData.lightColor,
        title: Text("Movies_App"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
          BottomNavigationBarItem(
              icon: Icon(Icons.open_in_browser), label: "BROWSE"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "WATCHLIST"),
        ],
      ),
      body: taps[index],
    );
  }
}
