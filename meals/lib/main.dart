import 'package:flutter/material.dart';
import 'package:meals/pages/meal_details_page.dart';
import 'pages/meals_page.dart';
import 'pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMeals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.pink,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: CategoriesPage(),
      routes: {
        MealsPage.routeName: (ctx) => MealsPage(),
        MealDetailsPage.routeName: (ctx) => MealDetailsPage(),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}
