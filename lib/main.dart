import 'package:flutter/material.dart';

import './dummy_data.dart';
import './screens/filters_screen.dart';
import './screens/tabs_navigator.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';
import './screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
      ),
      home: TabsNav(),
      // home is default '/'
      routes: {
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // the route to load if you go to an non-registered route... Used when the app generates dynamic routes on its lifecycle
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },
      // if everything fails unknow route will be the last resource, so the user never crashes app
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

// #### using mediaquery inside theme

// final mediaQuery = MediaQuery.of(context);
//     Use builder of MaterialApp instead. So that you can use MediaQuery instantiated by MatetialApp inside your Theme.
// example
// new MaterialApp(
//   builder: (context, child) {
//     return new Theme(
//       data: getTheme(MediaQuery.of(context)),
//       child: child,
//     );
//   },
//   home: new ChatScreen(),
// ),
