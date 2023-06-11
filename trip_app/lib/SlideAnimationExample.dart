import 'package:flutter/material.dart';
import 'package:trip_app/main.dart';

class SlideAnimationExample extends StatefulWidget {
  final Widget widgetChild;
  SlideAnimationExample({required this.widgetChild});

  @override
  _SlideAnimationExampleState createState() => _SlideAnimationExampleState();
}

class _SlideAnimationExampleState extends State<SlideAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: widget.widgetChild,
      ),
    );
  }
}
