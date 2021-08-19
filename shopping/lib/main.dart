import 'package:flutter/material.dart';
import 'package:shopping/pages/products_details_page.dart';
import './pages/products_overview_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopPing',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.red,
        fontFamily: 'Lato',
      ),
      home: ProductsOverviewPage(),
      routes: {
        ProductDetailsPage.routeName: (ctx) => ProductDetailsPage(),
      },
    );
  }
}
