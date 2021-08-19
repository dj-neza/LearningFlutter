import 'package:flutter/material.dart';
import './models/meal.dart';
import './dummy_data.dart';
import 'pages/filters_page.dart';
import 'pages/meal_details_page.dart';
import 'pages/tabs_page.dart';
import 'pages/meals_page.dart';
import 'pages/categories_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'lactose': false,
    'vegan': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        } else if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        } else if (_filters['vegan']! && !meal.isVegan) {
          return false;
        } else if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((element) => element.id == mealId);
  }

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
      home: TabsPage(_favoriteMeals),
      routes: {
        MealsPage.routeName: (ctx) => MealsPage(_availableMeals),
        MealDetailsPage.routeName: (ctx) =>
            MealDetailsPage(_toggleFavorite, _isFavorite),
        FiltersPage.routeName: (ctx) => FiltersPage(_filters, _setFilters),
      },
      onUnknownRoute: (_) {
        return MaterialPageRoute(builder: (ctx) => CategoriesPage());
      },
    );
  }
}
