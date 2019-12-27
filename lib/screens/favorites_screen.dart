import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;

  FavoritesScreen(this.favorites);

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(child: Text('There is no favorites yet'));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(meal: favorites[index]);
        },
        itemCount: favorites.length,
      );
    }
  }
}
