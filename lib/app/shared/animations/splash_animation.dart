import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class SplashAnimation extends StatelessWidget {
  final Widget child;

  SplashAnimation({@required this.child});

  final _tween = MultiTween<AnimProps>()
    ..add(
      AnimProps.scale,
      Tween(begin: 0.0, end: 1.0),
      Duration(milliseconds: 1500),
    )
    ..add(
      AnimProps.rotate,
      Tween(begin: 2.0, end: 0.0),
      Duration(milliseconds: 1500),
    );

  @override
  Widget build(BuildContext context) {
    return PlayAnimation<MultiTweenValues<AnimProps>>(
      tween: _tween,
      delay: Duration(milliseconds: 100),
      duration: _tween.duration,
      child: child,
      builder: (context, child, value) {
        return Transform.scale(
          scale: value.get(AnimProps.scale),
          child: Transform.rotate(
            angle: 2.0 * pi * value.get(AnimProps.rotate),
            child: child,
          ),
        );
      },
    );
  }
}

enum AnimProps { scale, rotate }
