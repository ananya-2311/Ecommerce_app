import 'package:flutter/material.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/orders.dart';
import 'package:shopping_app/widgets/cart.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/widgets/pdt_detail_screen.dart';
import 'package:shopping_app/widgets/cart_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        )
      ],


      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
        routes: {
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

