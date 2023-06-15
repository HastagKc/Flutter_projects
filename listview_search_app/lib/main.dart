import 'package:flutter/material.dart';
import 'package:listview_search_app/home_page.dart';
// import 'package:listview_search_app/model/gpt.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      // home: MyApp(),
    );
  }
}
