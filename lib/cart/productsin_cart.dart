import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/store/actions/fetchproducts_action.dart';
import 'package:ecommerce_app/store/store.dart';
import 'package:ecommerce_app/utils/text_util.dart';
import 'package:flutter/material.dart';

class ProductInCart extends StatelessWidget {
  const ProductInCart({super.key, required this.product});

  final Product product;

  void removeProduct(product){
    store.dispatch(RemoveProductFromCartAction(product));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(27, 0, 0, 0), width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)), // Add border
      ),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: [
            Image.network(product.thumbnail, width: 40),
            const SizedBox(width: 5),
            Text(shortenTitle(product.title)),
          ]),
          IconButton(
              onPressed: () {
                removeProduct(product);
              },
              icon: const Icon(Icons.close_rounded, size: 20)),
        ],
      ),
    );
  }
}
