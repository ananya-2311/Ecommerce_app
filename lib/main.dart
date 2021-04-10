import 'package:flutter/material.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widgets/orders.dart';
import 'package:shopping_app/widgets/cart.dart';
import 'package:shopping_app/models/products.dart';
import 'package:shopping_app/widgets/pdt_detail_screen.dart';
import 'package:shopping_app/widgets/cart_screen.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/widgets/red_dress.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

void main() {
  runApp(MyApp(

  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    this.initDynamicLinks();
  }

  void initDynamicLinks() async {
    final PendingDynamicLinkData data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            Navigator.pushNamed(context, deepLink.path);
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );
  }

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
        routes: <String, WidgetBuilder>{
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
          //'/': (BuildContext context) => HomePage(),
          '/red_dress': (BuildContext context) => RedDress(),
        },
      ),
    );
  }
}

