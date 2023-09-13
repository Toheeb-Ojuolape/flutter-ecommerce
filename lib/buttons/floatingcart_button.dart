import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingCartButton extends StatelessWidget {
  final Function() onPressed;
  const FloatingCartButton({required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
      converter: (store) => store.state.productsInCart,
      builder: (context, productsInCart) {
        return Stack(
          children: [
            FloatingActionButton(
              elevation: 0,
              backgroundColor: const Color(0xFFecfaff),
              onPressed: onPressed,
              child: SvgPicture.asset(
                "assets/icons/Cart.svg",
                width: 30,
              ),
            ),
            if (productsInCart.isNotEmpty)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: Text(
                    '${productsInCart.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),// This line was removed
          ],
        );
      },
    );
  }
}
