import 'package:ecommerce_app/models/product_model.dart';

class FetchProductsAction {
  late bool _loading;
  late List<Product> _products;

  bool get loading => _loading;
  List<Product> get products => _products;

  FetchProductsAction(
      {required bool loading, required List<Product> products}) {
    _loading = loading;
    _products = products;
  }
}

class AddProductToCartAction {
  final Product product;
  AddProductToCartAction(this.product);
}

class RemoveProductFromCartAction {
  final Product product;
  RemoveProductFromCartAction(this.product);
}
