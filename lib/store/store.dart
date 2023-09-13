import 'package:redux/redux.dart';
import 'package:ecommerce_app/store/reducers/fetchproducts_reducer.dart';
import 'package:ecommerce_app/store/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';

final store = Store(productsReducer, // Your existing reducer
    initialState: AppState.initialState(), // Initial state
    middleware: [thunkMiddleware]);




// this is where I'll add future reducers and middlewares