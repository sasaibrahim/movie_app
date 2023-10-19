import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/sections/detail_screen.dart';
import 'package:movie_app/sections/discover_movie.dart';
import 'package:movie_app/themes/mytheme.dart';

import 'firebase_options.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        DetailScreen.routeName: (context) => DetailScreen(),
        DiscoverMovie.routeName: (context) => DiscoverMovie(),
      },
      home: HomeLayout(),
    );
  }
}
