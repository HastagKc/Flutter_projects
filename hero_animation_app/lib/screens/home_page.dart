import 'package:flutter/material.dart';
import 'package:hero_animation_app/model/imageModel.dart';
import 'package:hero_animation_app/screens/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: imagesList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = imagesList[index];
            const heroTag = 'shoesListBuilderTag';
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      item: item.imageUrl,
                      imageIndex: index,
                      heroTag: heroTag,
                    ),
                  ),
                );
              },
              child: Card(
                elevation: 1,
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        item.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 241, 234, 234),
                          child: Text(
                            item.imageId,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          item.imageName,
                          style: const TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
