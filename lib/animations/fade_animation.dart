import 'package:flutter/cupertino.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';

class FadeAnimation extends StatelessWidget {
  final int delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder<double>(
      tween: Tween(begin: 2.0, end: 5.0),
      duration: Duration(seconds: delay),
      curve: Curves.bounceOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }
}