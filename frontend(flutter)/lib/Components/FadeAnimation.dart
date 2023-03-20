import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  // Widget build(BuildContext context) {
  //   final tween = MultiTween([
  //     Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
  //     Track("translateY").add(
  //       Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
  //       curve: Curves.easeOut)
  //   ]);

  //   return PlayAnimation(
  //     delay: Duration(milliseconds: (500 * delay).round()),
  //     duration: tween.duration,
  //     tween: tween,
  //     child: child,
  //     builderWithChild: (context, child, animation) => Opacity(
  //       opacity: animation["opacity"],
  //       child: Transform.translate(
  //         offset: Offset(0, animation["translateY"]), 
  //         child: child
  //       ),
  //     ),
  //   );


    Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      tween: Tween(begin: 50.0, end: 200.0),
      duration: const Duration(seconds: 5),
      child: const Center(child: Text('Hello!')), // pass in static child
      builder: (context, value, child) {
        return Container(
          width: value,
          height: value,
          color: Colors.green,
          child: child, // use child inside the animation
        );
      },
    );
  }
  
  }
