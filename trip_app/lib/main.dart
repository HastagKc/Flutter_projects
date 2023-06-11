import 'package:flutter/material.dart';
import 'package:trip_app/fade_in_animation.dart';
import 'package:trip_app/imageModel.dart';
import 'package:trip_app/slide_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // home: SlideAnimationExample(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int totalPage = images.length;
  void _onScroll() {
    print('Kc');
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          pageWidget(
            image: images[0].imageUrl,
            imageTitle: images[0].imageName,
            imageDis: images[0].imageDis,
            page: '1',
          ),
          pageWidget(
            image: images[1].imageUrl,
            imageTitle: images[1].imageName,
            imageDis: images[1].imageDis,
            page: '2',
          ),
          pageWidget(
            image: images[2].imageUrl,
            imageTitle: images[2].imageName,
            imageDis: images[2].imageDis,
            page: '3',
          ),
          pageWidget(
            image: images[3].imageUrl,
            imageTitle: images[3].imageName,
            imageDis: images[3].imageDis,
            page: '4',
          ),
        ],
      ),
    );
  }

  Widget pageWidget({
    required image,
    required imageTitle,
    required imageDis,
    required page,
  }) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.3, 0.9],
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    page,
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '/4',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SlideAnimation(
                      duration: const Duration(milliseconds: 850),
                      widgetChild: Text(
                        imageTitle,
                        style: const TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SlideAnimation(
                      widgetChild: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomeIcon(
                            icon: Icons.star,
                            color: Colors.yellow,
                          ),
                          CustomeIcon(
                            icon: Icons.star,
                            color: Colors.yellow,
                          ),
                          CustomeIcon(
                            icon: Icons.star,
                            color: Colors.yellow,
                          ),
                          CustomeIcon(
                            icon: Icons.star,
                            color: Colors.yellow,
                          ),
                          CustomeIcon(
                            icon: Icons.star,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            totalPage.toString(),
                            style: const TextStyle(
                              color: Colors.white38,
                              fontSize: 15.0,
                            ),
                          ),
                          const Text(
                            '(2300)',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                      duration: const Duration(
                        milliseconds: 950,
                      ),
                    ),
                    // !discription
                    FadeInAnimation(
                      widgetChild: Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: Text(
                          imageDis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            height: 1.5,
                            fontSize: 16.0,
                          ),
                          maxLines: 5,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      duration: const Duration(milliseconds: 800),
                    ),

                    const SizedBox(height: 10.0),

                    FadeInAnimation(
                      widgetChild: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      duration: const Duration(milliseconds: 900),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  const CustomeIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: 15.0,
    );
  }
}
