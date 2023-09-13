import 'package:ecommerce_app/store/middleware/fetchproducts_middleware.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ecommerce_app/store/store.dart';

void main() {
  store.dispatch(fetchProductsMiddleware);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BitcoinShop',
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          fontFamily: "PPRadio",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black54),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
