import 'package:flutter/material.dart';
import '../pages/meals_page.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  CategoryItem({
    required this.title,
    required this.color,
    required this.id,
  });

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(MealsPage.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
