import 'package:flutter/material.dart';

import '../assets/categories_list_dummy_data.dart';
import '../widgets/category_item.dart';

// ignore: use_key_in_widget_constructors
class CategoriesScreen extends StatelessWidget {
  final Widget bodyValue = GridView(
    padding: const EdgeInsets.all(25),
    children: DUMMY_CATEGORIES
        .map(
          (categoryItemData) => CategoryItem(
            categoryItemData.id,
            categoryItemData.title,
            categoryItemData.color,
          ),
        )
        .toList(),
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
      body: bodyValue,
    );
  }
}
