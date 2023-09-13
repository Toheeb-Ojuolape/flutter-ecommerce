import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/models/product_model.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce_app/store/actions/fetchproducts_action.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> fetchProductsMiddleware = (Store<AppState> store) async {
  try {
    store.dispatch(FetchProductsAction(
      loading: true,
      products: [],
    ));

    store.dispatch(FetchProductsAction(loading: true, products: []));
    final response = await http.get(Uri.parse('$apiUrl/products'));
    final List<Product> products = (json.decode(response.body)['data'] as List)
        .map((data) => Product.fromJson(data))
        .toList();
    store.dispatch(FetchProductsAction(
      loading: false,
      products: products,
    ));
  } catch (e) {
    store.dispatch(FetchProductsAction(
      loading: true,
      products: [],
    ));
  }
};
