import 'package:flutter/material.dart';
import '../pages/products_details_page.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailsPage.routeName, arguments: id);
          },
          child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline_rounded),
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart_rounded),
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
