import 'package:flutter/material.dart';
import 'package:hero_animation_app/model/imageModel.dart';

class DetailPage extends StatelessWidget {
  final String item;
  final int imageIndex;
  final String heroTag;

  const DetailPage({
    required this.item,
    required this.heroTag,
    required this.imageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '$heroTag',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                item,
                fit: BoxFit.cover,
              ),
              DraggableScrollableSheet(
                initialChildSize:
                    0.2, // Set the initial size of the sheet (0.0 - 1.0)
                minChildSize:
                    0.2, // Set the minimum size the sheet can be dragged to
                maxChildSize: 0.4,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                costumText(
                                  textTitle: imagesList[imageIndex].imageDes,
                                  fontSize: 24.0,
                                  isBold: true,
                                ),
                                costumText(
                                  textTitle: imagesList[imageIndex].price,
                                  fontSize: 24.0,
                                  isBold: true,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            costumText(
                              textTitle: imagesList[imageIndex].category,
                              fontSize: 18,
                              isBold: false,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 10.0),
                            costumText(
                              textTitle: imagesList[imageIndex].rating,
                              fontSize: 18,
                              isBold: false,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 18.0),
                            costumText(
                              textTitle: 'Choose Size',
                              fontSize: 16.0,
                              isBold: false,
                            ),
                            Row(
                              children: [
                                CustomCircularAvtar(text: 'S'),
                                CustomCircularAvtar(text: 'M'),
                                CustomCircularAvtar(text: 'L'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget costumText({
    required String textTitle,
    required double fontSize,
    required bool isBold,
    Color color = Colors.black,
  }) {
    return Text(
      textTitle,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }

  Widget CustomCircularAvtar({required String text}) {
    return InkWell(
      onDoubleTap: () {},
      child: Container(
        width: 50.0,
        height: 80.0,
        // color: Colors.green,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: costumText(
                textTitle: text,
                fontSize: 16.0,
                isBold: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
