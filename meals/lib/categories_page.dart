import 'package:flutter/material.dart';

import './category_item.dart';
import './dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyMeals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(16),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
                  color: catData.color,
                  title: catData.title,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
