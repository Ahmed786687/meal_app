import 'package:flutter/material.dart';

import './assets/dummy_data.dart';
import './models/meal.dart';

import './screens/filter_screen.dart';
import './screens/meal_detail_screen.dart';
import '../screens/categories_meal_screen.dart';
import '../screens/categories_screen.dart';
import './screens/tabs_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _addRemoveFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(
        () {
          _favoriteMeals.removeAt(existingIndex);
        },
      );
    } else {
      setState(() {
        _favoriteMeals.add(
          (DUMMY_MEALS.firstWhere((element) => element.id == mealId)),
        );
      });
    }
  }

  bool _isFavoriteMeals(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Meal",
      theme: ThemeData(
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.teal,
          secondary: Colors.tealAccent.shade100,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 250, 1),
        fontFamily: 'Raleway',
        iconTheme: IconThemeData(color: Colors.teal.shade700),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.grey.shade900,
              ),
              bodyText2: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w400,
              ),
              subtitle1: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        // '/': (ctx) => CategoriesScreen(),
        '/': (ctx) => TabsScreen(_favoriteMeals),
        CategoriesMealScreen.routeNamed: (ctx) =>
            CategoriesMealScreen(_availableMeals),
        MealDetialScreen.routeNamed: (ctx) =>
            MealDetialScreen(_addRemoveFavorite, _isFavoriteMeals),
        FilterScreen.routeNamed: (ctx) => FilterScreen(_filters, _setFilters)
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (context)=> CategoriesScreen(),);
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
    );
  }
}
