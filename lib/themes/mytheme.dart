import 'package:flutter/material.dart';

/////////singleton//////
class MyThemeData {
  static const Color lightColor = Color(0xffB7935F);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
    primaryColor: lightColor,
  );
}
