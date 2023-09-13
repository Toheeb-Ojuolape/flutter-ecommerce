import 'package:ecommerce_app/loader/skeleton_loader.dart';
import 'package:flutter/material.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomSkeletonLoader(width: 154, height: 100, borderRadius: 8),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // will come and fix this to justify later
              CustomSkeletonLoader(width: 40, height: 10, borderRadius: 8),
              SizedBox(width:10),
              CustomSkeletonLoader(width: 40, height: 10, borderRadius: 8),
            ],
          ),
        ],
      ),
    );
  }
}
