// Favourite.dart
import 'package:flutter/material.dart';

import 'meals.dart';

class Favourite extends StatelessWidget {
  final List<String> favoriteMeals;

  const Favourite({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Meals'),
      ),
      body: ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteMeals[index]),
            onTap: ()=> handleonTap(context,favoriteMeals[index] )
            // Add more details or custom UI for each favorite meal
          );
        },
      ),
    );
  }
}
void handleonTap(BuildContext context, String name) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Meals(mealName: name)),
  );
}
