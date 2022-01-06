import 'package:flutter/material.dart';

import '../screens/categories_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealScreen(id, title);
    //     },
    //   ),
    // );
    Navigator.of(context).pushNamed(
      CategoriesMealScreen.routeNamed,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              color.withOpacity(0.5),
              color,
            ],
            center: Alignment.center,
            focal: Alignment.bottomCenter,

            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
