import 'package:flutter/material.dart';

class CommonElevated extends StatefulWidget {
  final btnText;
  bool isIncrementDecrement;
  int counter;
  CommonElevated({
    super.key,
    required this.btnText,
    required this.isIncrementDecrement,
    required this.counter,
  });

  @override
  State<CommonElevated> createState() => _CommonElevatedState();
}

class _CommonElevatedState extends State<CommonElevated> {
  void increment() {
    setState(() {
      widget.counter++;
    });
  }

  void decrement() {
    setState(() {
      widget.counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.isIncrementDecrement ? increment() : decrement();
      },
      child: Text(widget.btnText),
    );
  }
}
