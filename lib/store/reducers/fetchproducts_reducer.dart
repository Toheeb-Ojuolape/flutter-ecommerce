import 'package:ecommerce_app/store/actions/fetchproducts_action.dart';
import 'package:ecommerce_app/store/app_state.dart';

AppState productsReducer(AppState state, dynamic action) {
  if (action is FetchProductsAction) {
    return AppState(
        loading: action.loading, products: action.products, productsInCart: []);
  }

  if (action is AddProductToCartAction) {
    return AppState(
        loading: state.loading,
        products: state.products,
        productsInCart: [...state.productsInCart, action.product]);
  }

    if (action is RemoveProductFromCartAction) {
    return AppState(
        loading: state.loading,
        products: state.products,
        productsInCart: state.productsInCart.where((product) => product != action.product).toList(),
        );
  }
  return state;
}
