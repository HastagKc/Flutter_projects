import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelloWorld extends StatefulWidget {
  const HelloWorld({super.key});

  @override
  State<HelloWorld> createState() => _HelloWorldState();
}

class _HelloWorldState extends State<HelloWorld> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Hello World',
          style: GoogleFonts.ptSerif(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
