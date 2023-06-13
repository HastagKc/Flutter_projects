import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String item;
  final String heroTag;

  const DetailPage({required this.item, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Hero(
          tag: '$heroTag',
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              item,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
