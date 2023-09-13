import 'package:ecommerce_app/screens/home/components/products_loading.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:ecommerce_app/screens/details/details_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class ProductsList extends StatelessWidget {
  const ProductsList(
      {Key? key,
      required this.title,
      required this.type,
      required this.products
      })
      : super(key: key);

  final String title;
  final String type;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: title,
            pressSeeAll: () {},
          ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                products.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: ProductCard(
                    title: products[index].title,
                    image: products[index].thumbnail,
                    price: products[index].price,
                    bgColor: const Color(0xFFEFEFF2),
                    press: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: products[index]),
                          ));
                    },
                  ),
                ),
              ),
            )),

        // loading state
        StoreConnector<AppState, bool>(
            converter: (store) => store.state.loading,
            builder: (context, loading) {
              return ProductsLoading(loading: loading);
            }),
      ],
    );
  }
}
