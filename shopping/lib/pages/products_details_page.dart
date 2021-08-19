import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(productId.toString()),
      ),
    );
  }
}
