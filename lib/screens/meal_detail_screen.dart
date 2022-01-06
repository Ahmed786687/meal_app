import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_app/assets/dummy_data.dart';

// ignore: use_key_in_widget_constructors
class MealDetialScreen extends StatelessWidget {
  static const routeNamed = '/meal-details';

  const MealDetialScreen({Key? key}) : super(key: key);

  Widget mealSubTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 300,
      height: 200,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              mealSubTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    elevation: 10,
                    // ignore: deprecated_member_use
                    // color: Theme.of(context).primaryColor,
                    shadowColor: Theme.of(context).primaryColorDark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Text(
                        selectedMeal.ingredients.elementAt(index),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              mealSubTitle(context, 'Steps'),
              buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            '${(index + 1)}.',
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps.elementAt(index),
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
