import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  // creating list of images

  @override
  Widget build(BuildContext context) {
    List<String> diceImages = [
      'assets/diceimages/dice1.png',
      'assets/diceimages/dice2.png',
      'assets/diceimages/dice3.png',
      'assets/diceimages/dice4.png',
      'assets/diceimages/dice5.png',
      'assets/diceimages/dice6.png',
    ];

    // creating function

    void rollDiceFun() {}
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
                  image: AssetImage(diceImages[0]),
                ),
              ),
            ),
            CustomButton(
              text: 'Roll Dice',
              onPressed: rollDiceFun,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 8, 1, 112),
        backgroundColor: const Color.fromARGB(255, 28, 217, 230),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
