import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world_app/hello_world.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const HelloWorld(),
                  transition: Transition.upToDown,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shadowColor: Color.fromARGB(255, 255, 5, 5),
                elevation: 2,
              ),
              child: const Text('Go to Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
