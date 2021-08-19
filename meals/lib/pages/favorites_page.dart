import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesPage(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'You currently have no favorites but you can start adding them!',
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favoriteMeals[index].id,
              title: favoriteMeals[index].title,
              imageUrl: favoriteMeals[index].imageUrl,
              duration: favoriteMeals[index].duration,
              complexity: favoriteMeals[index].complexity,
              affordability: favoriteMeals[index].affordability);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
