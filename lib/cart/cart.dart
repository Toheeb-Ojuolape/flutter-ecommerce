import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Cart extends StatelessWidget {
  final Function() onPressed;
  const Cart({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
      converter: (store) => store.state.productsInCart,
      builder: (context, productsInCart) {
        return Padding(
          padding:const EdgeInsets.fromLTRB(0, 5, 0,0),
          child: Stack(
            children: [
              TextButton(
                onPressed: onPressed,
                child: SvgPicture.asset(
                  "assets/icons/Cart.svg",
                  width: 20,
                ),
              ),
              if (productsInCart.isNotEmpty)
                Positioned(
                  top: 4,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      '${productsInCart.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                      ),
                    ),
                  ),
                ), // This line was removed
            ],
          ),
        );
      },
    );
  }
}
