import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeNamed = '/categories-meal';

  final List<Meal> availableMeals;
  // ignore: use_key_in_widget_constructors
  const CategoriesMealScreen(this.availableMeals);
  // const CategoriesMealScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesMealScreen> createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  late String categoryTitle;
  late List<Meal> displayedMeal;
  var _loadInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadInitData) {
      final routeArguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArguments['id'];
      categoryTitle = routeArguments['title'] as String;
      displayedMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }
    _loadInitData = true;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal.elementAt(index).id,
            title: displayedMeal.elementAt(index).title,
            imageUrl: displayedMeal.elementAt(index).imageUrl,
            affordability: displayedMeal.elementAt(index).affordability,
            complexity: displayedMeal.elementAt(index).complexity,
            duration: displayedMeal.elementAt(index).duration,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
