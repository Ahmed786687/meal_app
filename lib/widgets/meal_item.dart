import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;

  // ignore: use_key_in_widget_constructors
  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.duration,
  });

  // ignore: non_constant_identifier_names
  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

  // ignore: non_constant_identifier_names
  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  Widget mealQuickInfo(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }

  Widget imageViewBuilder() {
    return Stack(
      children: <Widget>[
        ClipRRect(
          child: Image.network(
            imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.black54,
            // padding: EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    );
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetialScreen.routeNamed,
      arguments: 
        id,
        // 'title': title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            imageViewBuilder(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  mealQuickInfo(Icons.schedule, '$duration min'),
                  mealQuickInfo(Icons.work, complexityText),
                  mealQuickInfo(Icons.attach_money, affordabilityText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
