import 'package:flutter/material.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeNamed = '/categories_meal';

  const CategoriesMealScreen({Key? key}) : super(key: key);
  // final String categoryId;
  // final String categoryTitle;

  // const CategoriesMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // ignore: unused_local_variable
    final categoryId = routeArguments['id'];
    final categoryTitle = routeArguments['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: const Center(
        child: Text('A meal Recipy is on the way'),
      ),
    );
  }
}
