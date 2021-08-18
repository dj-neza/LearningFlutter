import 'package:flutter/material.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final mealTitle = routeArgs['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text(mealTitle!),
      ),
      body: Text('MEAL!'),
    );
  }
}
