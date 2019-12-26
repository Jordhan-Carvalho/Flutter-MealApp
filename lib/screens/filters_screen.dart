import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

// to keep the filters as you set when come back to the screen
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentVal, Function updateVal) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: currentVal,
      subtitle: Text(subtitle),
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile("Gluten-free",
                    "Only include gluten-free meals", _glutenFree, (newVal) {
                  setState(() {
                    _glutenFree = newVal;
                  });
                }),
                _buildSwitchListTile("Lactose-free",
                    "Only include lactose-free meals", _lactoseFree, (newVal) {
                  setState(() {
                    _lactoseFree = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian", "Only include Vegetarian meals", _vegetarian,
                    (newVal) {
                  setState(() {
                    _vegetarian = newVal;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan", "Only include Vegan meals", _vegan, (newVal) {
                  setState(() {
                    _vegan = newVal;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
