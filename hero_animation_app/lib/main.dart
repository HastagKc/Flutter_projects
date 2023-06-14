import 'package:flutter/material.dart';
import 'package:hero_animation_app/screens/home_page.dart';

// import 'package:hero_animation_app/screens/shoe_size.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      // home: ShoeSizeBox(),
    );
  }
}
