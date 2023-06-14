import 'dart:math';
import 'package:flutter/material.dart';

final rondomrizer = Random();

class DicePage extends StatefulWidget {
  const DicePage({super.key});
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // creating list of images
  List<String> diceImages = [
    'assets/diceimages/dice1.png',
    'assets/diceimages/dice2.png',
    'assets/diceimages/dice3.png',
    'assets/diceimages/dice4.png',
    'assets/diceimages/dice5.png',
    'assets/diceimages/dice6.png',
  ];

  // creating function
  int currentDiceIndex = 2;
  void rollDiceFun() {
    setState(() {
      currentDiceIndex = rondomrizer.nextInt(6);
      print(currentDiceIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(diceImages[currentDiceIndex]),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: rollDiceFun,
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 8, 1, 112),
                backgroundColor: const Color.fromARGB(255, 28, 217, 230),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Roll Dice',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
