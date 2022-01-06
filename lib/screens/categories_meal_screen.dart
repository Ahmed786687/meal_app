import 'package:flutter/material.dart';

import '../assets/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeNamed = '/categories-meal';

  const CategoriesMealScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // const CategoriesMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        // padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal.elementAt(index).id,
            title: categoryMeal.elementAt(index).title,
            imageUrl: categoryMeal.elementAt(index).imageUrl,
            affordability: categoryMeal.elementAt(index).affordability,
            complexity: categoryMeal.elementAt(index).complexity,
            duration: categoryMeal.elementAt(index).duration,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
