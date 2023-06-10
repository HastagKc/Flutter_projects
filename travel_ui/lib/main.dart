import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double screenHeight =
        mediaQuery.size.height - mediaQuery.padding.top - kToolbarHeight;
    final double screenWidth = mediaQuery.size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          padding: const EdgeInsets.all(12.0),
          // color: Colors.red,
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/icons/menu.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 32.0,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Ibclude appbar$mediaQuery'),
          Text('Height:$screenHeight'),
          Text('width:$screenWidth'),
        ],
      ),
    );
  }
}
