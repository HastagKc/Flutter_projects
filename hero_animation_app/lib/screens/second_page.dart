import 'package:flutter/material.dart';
import 'package:hero_animation_app/model/imageModel.dart';
import 'package:hero_animation_app/screens/customWidegts.dart';

class DetailPage extends StatefulWidget {
  final String item;
  final int imageIndex;
  final String heroTag;

  const DetailPage({
    required this.item,
    required this.heroTag,
    required this.imageIndex,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String selectedSize = '';

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: '${widget.heroTag}',
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                widget.item,
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
                                CustomWidgets().costumText(
                                  textTitle:
                                      imagesList[widget.imageIndex].imageDes,
                                  fontSize: 24.0,
                                  isBold: true,
                                ),
                                CustomWidgets().costumText(
                                  textTitle:
                                      imagesList[widget.imageIndex].price,
                                  fontSize: 24.0,
                                  isBold: true,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            CustomWidgets().costumText(
                              textTitle: imagesList[widget.imageIndex].category,
                              fontSize: 18,
                              isBold: false,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 10.0),
                            CustomWidgets().costumText(
                              textTitle: imagesList[widget.imageIndex].rating,
                              fontSize: 18,
                              isBold: false,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 18.0),
                            CustomWidgets().costumText(
                              textTitle: 'Choose Size',
                              fontSize: 16.0,
                              isBold: false,
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                shoeSizedBox(),
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

  Widget shoeSizedBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _selectSize('Small'),
          child: Container(
            // margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: 'Small' == selectedSize
                  ? const Color.fromARGB(255, 248, 202, 202)
                  : Colors.transparent,
            ),
            child: Text(
              'Small',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: 'Small' == selectedSize ? Colors.white : Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectSize('Medium'),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: 'Medium' == selectedSize
                  ? const Color.fromARGB(255, 248, 202, 202)
                  : Colors.transparent,
            ),
            child: Text(
              'Medium',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: 'Medium' == selectedSize ? Colors.white : Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => _selectSize('Large'),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: 'Large' == selectedSize
                  ? const Color.fromARGB(255, 248, 202, 202)
                  : Colors.transparent,
            ),
            child: Text(
              'Large',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: 'Large' == selectedSize ? Colors.white : Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
