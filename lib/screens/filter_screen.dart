import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeNamed = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  // ignore: use_key_in_widget_constructors
  const FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;

    super.initState();
  }

  Widget _buildSwitchListView(
      String title, String subtitle, bool currentValue, final updateValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        actions: [
          IconButton(
            onPressed: () {
              Map<String, bool> _selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(_selectedFilters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(
              'Adjust Meal Selections',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListView(
                  'Gluten Free',
                  'Display only Gluten Free Meals',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListView(
                  'Vegan',
                  'Display only Vegan Meals',
                  _vegan,
                  (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListView(
                  'Vegetarian Free',
                  'Display only Vegetarian Meals',
                  _vegetarian,
                  (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListView(
                  'LactoseFree',
                  'Display only LactoseFree Meals',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
