import 'package:flutter/material.dart';
import 'package:trip_app/imageModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

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
          ),
          pageWidget(
            image: images[1].imageUrl,
            imageTitle: images[1].imageName,
          ),
          pageWidget(
            image: images[2].imageUrl,
            imageTitle: images[2].imageName,
          ),
          pageWidget(
            image: images[3].imageUrl,
            imageTitle: images[3].imageName,
          ),
        ],
      ),
    );
  }

  Widget pageWidget({
    required image,
    required imageTitle,
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '1',
                    style: TextStyle(
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
                    Text(
                      imageTitle,
                      style: const TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Row(
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
                      ],
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
  CustomeIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
    );
  }
}
