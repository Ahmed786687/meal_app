import 'package:flutter/material.dart';

import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData iconData, BuildContext context,
      Function onTapHandler) {
    return ListTile(
      // tileColor: const Color.fromRGBO(0, 128, 128, 0.1),
      onTap: () => onTapHandler(),
      leading: Icon(
        iconData,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            // ignore: deprecated_member_use
            // color: Theme.of(context).accentColor,
            color: Theme.of(context).primaryColor,
            child: const Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          buildListTile(
            'Meals',
            Icons.restaurant,
            context,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.filter_alt_rounded,
            context,
            () {
              Navigator.of(context).pushReplacementNamed(FilterScreen.routeNamed);
            },
          ),
          buildListTile('About', Icons.info, context, () {
            showAboutDialog(
              context: context,
              applicationName: 'DaliMeal',
              applicationVersion: '1.0.0.1',
              applicationIcon: const Icon(Icons.restaurant_menu),
              children: <Widget>[
                const Text(
                    '''DaliMeal App provides you list of recipies to cook any thing easily!
                    \nBE HAPPY AND ENJOY YOUR MEAL!'''),
              ],
              // applicationIcon:
            );
          }),
        ],
      ),
    );
  }
}
