import 'package:ecommerce_app/buttons/floatingcart_button.dart';
import 'package:ecommerce_app/cart/cart.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/home/components/products_list.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/constants.dart';

import 'components/categories.dart';
import 'components/search_form.dart';
import 'components/drawer_content.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "fetch user's location here",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        actions: [
          Cart(onPressed: openDrawer),
        ],
      ),
       drawer: const Align(
          alignment: Alignment.centerLeft,
          child: Drawer(child: DrawerContent())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BitcoinShop",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
            ),
            const Text(
              "Best Gadget deals for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
            const Categories(),
            StoreConnector<AppState, List<Product>>(
                converter: (store) => store.state.products,
                builder: (context, products) {
                  return Column(
                    children: [
                      ProductsList(
                        title: 'All Products',
                        type: 'all',
                        products: products,
                      ),
                      ProductsList(
                          title: 'Devices',
                          type: 'device',
                          products: products
                              .where((product) => product.category == 'device')
                              .toList()),
                      ProductsList(
                          title: 'Accessories',
                          type: 'accessories',
                          products: products
                              .where((product) =>
                                  product.category == 'accessories')
                              .toList()),
                    ],
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingCartButton(onPressed: openDrawer),
    );
  }
}
