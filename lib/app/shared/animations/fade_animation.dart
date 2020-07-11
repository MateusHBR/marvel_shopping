import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({@required this.delay, @required this.child});

  final _tween = MultiTween<AnimationProps>()
    ..add(
      AnimationProps.opacity,
      Tween(begin: 0.0, end: 1.0),
      Duration(milliseconds: 500),
    );

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<MultiTweenValues<AnimationProps>>(
      tween: _tween,
      duration: _tween.duration,
      child: child,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, child, value) {
        return Opacity(
          opacity: value.get(AnimationProps.opacity),
          child: child,
        );
      },
    );
  }
}

enum AnimationProps { opacity, translateY }
