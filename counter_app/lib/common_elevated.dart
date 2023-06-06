import 'package:flutter/material.dart';

class CommonElevated extends StatefulWidget {
  final btnText;
  final VoidCallback onPressed;

  CommonElevated({
    super.key,
    required this.btnText,
    required this.onPressed,
  });

  @override
  State<CommonElevated> createState() => _CommonElevatedState();
}

class _CommonElevatedState extends State<CommonElevated> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(widget.btnText),
    );
  }
}
