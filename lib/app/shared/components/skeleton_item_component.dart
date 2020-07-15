import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItemComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400],
      highlightColor: Colors.white,
      child: Container(
        color: Colors.grey[400],
      ),
    );
  }
}
