import 'package:ecommerce_app/cart/productsin_cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Product>>(
      converter: (store) => store.state.productsInCart,
      builder: (context, productsInCart) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                productsInCart.length,
                (index) => Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: ProductInCart(product: productsInCart[index]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
