import 'package:flutter/material.dart';
import 'package:todo_app/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      // theme: ,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
