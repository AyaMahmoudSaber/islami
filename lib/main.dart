import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:islami_app/HomePage.dart';
import 'package:islami_app/Quran/SuraDetailsScreen.dart';

void main() {
  runApp(MyApp());
}
class MyThemeData{
  static final primaryColor=Color.fromRGBO(183, 147, 95, 1.0);
  static final SelectedColor=Color.fromRGBO(36, 36, 36, 1.0);
  static final unSelectedColor=Color.fromRGBO(248, 248, 248, 1.0);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        ),
        primaryColor: MyThemeData.primaryColor,
      ),
      title: 'Flutter Demo',
      routes: {
        HomePage.routeName: (buildContext) => HomePage(),
        SuraDatielsScreen.routeName:(buildContext)=>SuraDatielsScreen(),
      },
      initialRoute: HomePage.routeName,
    );
  }
  }