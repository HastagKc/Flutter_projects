import 'package:counter_app/common_elevated.dart';
import 'package:flutter/material.dart';

class StatefulCounter extends StatefulWidget {
  const StatefulCounter({super.key});

  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  // creating counterVariable
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 45.0,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CommonElevated(
                btnText: '-',
                onPressed: decrement,
              ),
              CommonElevated(
                onPressed: increment,
                btnText: '+',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
