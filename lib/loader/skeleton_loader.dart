import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomSkeletonLoader extends StatelessWidget {
  const CustomSkeletonLoader(
      {Key? key,
      required this.width,
      required this.height,
      required this.borderRadius})
      : super(key: key);
      
  final double width;
  final double height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
