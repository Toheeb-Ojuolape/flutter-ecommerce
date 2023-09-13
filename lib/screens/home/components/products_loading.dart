import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/loader/product_skeleton.dart';
import 'package:flutter/material.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({Key? key, required this.loading}) : super(key: key);
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            5,
            (index) => const Padding(
              padding: EdgeInsets.only(right: defaultPadding),
              child: ProductSkeleton(),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox
          .shrink(); // Render an empty SizedBox when loading is false
    }
  }
}
