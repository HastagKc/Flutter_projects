import 'package:flutter/material.dart';
import 'package:travel_ui/image_model.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // creating tabbar list

  List<String> tabBarList = [
    'Recommeded',
    'Popular',
    'New Destination',
    'Hidden',
  ];

  List<ImageModel> imageBannerList = [
    ImageModel(
      imageName: 'Venice, Italy',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/hbz-venice-gettyimages-489741024-1505338894.jpg?crop=1xw:1xh;center,top&resize=980:*',
    ),
    ImageModel(
      imageName: 'Banff National Park, Canada',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/banff-517747003-1494616292.jpg?crop=0.9997418022205009xw:1xh;center,top&resize=980:*',
    ),
    ImageModel(
      imageName: 'Machu Picchu',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/hbz-machu-ppichu-gettyimages-629556601-1505338681.jpg?crop=1xw:1xh;center,top&resize=980:*',
    ),
    ImageModel(
      imageName: 'Great Ocean Road, Australia',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/great-ocean-road-128394846-1494616348.jpg?crop=1xw:1xh;center,top&resize=980:*',
    ),
  ];

// making list of btn

  List<String> btnTitle = [
    'Beach',
    'Mountain',
    'Lake',
    'City',
  ];
  @override
  Widget build(BuildContext context) {
    // creating media query

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
      body: Container(
        padding: const EdgeInsets.only(left: 20.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextStyle(
                  textValue: 'Explore',
                  textSize: 32.0,
                ),
                customTextStyle(
                  textValue: 'the Nature',
                  textSize: 32.0,
                ),
                const SizedBox(height: 10.0),
                Container(
                  width: screenWidth,
                  height: 50.0,
                  // color: Colors.red,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tabBarList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          tabBarList[index],
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Creating image list banner
                Container(
                  height: 220,
                  width: screenWidth,
                  // color: Colors.blue,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageBannerList.length,
                    itemBuilder: (BuildContext context, index) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: Card(
                              elevation: 1,
                              child: Container(
                                width: 220,
                                height: 200,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      imageBannerList[index].imageUrl,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 20.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/icons/icon-location.png',
                                  color: Colors.white,
                                  width: 22.0,
                                  height: 22.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Container(
                                    width: 120,
                                    child: Text(
                                      imageBannerList[index].imageName,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextStyle(
                  textValue: 'Popular Categories',
                  textSize: 22.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Show All'),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: btnTitle.map((label) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      elevation: 0,
                    ),
                    onPressed: () {
                      print(label);
                    },
                    child: Text(label),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 10.0),
            Container(
              width: screenWidth,
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageBannerList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      width: 220,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imageBannerList[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customTextStyle({
  required String textValue,
  required double textSize,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 5.0,
    ),
    child: Text(
      textValue,
      style: TextStyle(
        fontSize: textSize,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
