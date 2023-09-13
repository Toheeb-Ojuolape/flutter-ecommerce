import 'package:ecommerce_app/models/product_model.dart';

class AppState {
  bool loading;
  List<Product> products;
  List<Product> productsInCart;
  AppState({required this.loading,required this.products, required this.productsInCart});
  AppState.initialState() : products = [], loading = false,productsInCart = [];
}