import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pageList = [
    {'page': CategoriesScreen(), 'title': 'Meals Category'},
    {'page':const FavoritesScreen(), 'title':'Favorites Meal'},
  ];

  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageList[_selectedPageIndex]['title'] as String),
      ),
      drawer: const MainDrawer(),
      body: _pageList[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        // ignore: deprecated_member_use
        backgroundColor: Theme.of(context).primaryColorDark,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).primaryColorLight,
        selectedFontSize: 16,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.shifting,

        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.category),
            // activeIcon: Theme.of(context).iconTheme,
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: const Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Meals'),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Categories',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.favorite,
    //             ),
    //             text: 'Favorites',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(
    //       children: <Widget>[
    //         CategoriesScreen(),
    //         const FavoritesScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
