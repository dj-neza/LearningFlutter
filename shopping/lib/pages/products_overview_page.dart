import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';

class ProductsOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopPing'),
      ),
      body: ProductsGrid(),
    );
  }
}
