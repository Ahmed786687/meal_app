import 'package:flutter/material.dart';


import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  // ignore: use_key_in_widget_constructors
  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no Favorites yet.\n\nStart Adding Some!'),
      );
    } else {
      return ListView.builder(
        // padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals.elementAt(index).id,
            title: favoriteMeals.elementAt(index).title,
            imageUrl: favoriteMeals.elementAt(index).imageUrl,
            affordability: favoriteMeals.elementAt(index).affordability,
            complexity: favoriteMeals.elementAt(index).complexity,
            duration: favoriteMeals.elementAt(index).duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
