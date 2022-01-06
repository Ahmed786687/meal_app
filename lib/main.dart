import 'package:flutter/material.dart';
import '../screens/categories_meal_screen.dart';
import '../screens/categories_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeal",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.teal.shade900,
            secondary: Colors.amber,
          ),
          canvasColor: const Color.fromRGBO(255, 234, 250, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Colors.grey.shade900,
                ),
                bodyText2: TextStyle(
                  color: Colors.grey.shade900,
                ),
                subtitle1: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx)=> CategoriesScreen(),
        CategoriesMealScreen.routeNamed : (ctx) =>  CategoriesMealScreen(),
      },
    );
  }
}
