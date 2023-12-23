import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  final String mealName;

  Meals({Key? key, required this.mealName}) : super(key: key);

  // Map of meal names to corresponding image URLs or assets
  final Map<String, String> mealImages = {
    'Burger': 'assets/Burger.jpg',
    'Pizza': 'assets/Pizza.jpg',
    'Shawarma': 'assets/Shawarma.jpg',
    'Sandwich': 'assets/Sandwich.jpg',
    'Fries': 'assets/Fries.jpg',
  };

  // Map of meal names to corresponding ingredients
  final Map<String, List<String>> mealIngredients = {
    'Burger': ['Buns', 'Beef patty', 'Lettuce', 'Tomato', 'Cheese'],
    'Pizza': ['Pizza dough', 'Tomato sauce', 'Cheese', 'Pepperoni'],
    'Shawarma': ['Bread', 'Chicken', 'Garlic sauce'],
    'Sandwich': ['Bread', 'Ham', 'Cheese', 'Lettuce', 'Tomato'],
    'Fries': ['Potato', 'Cheese', 'Bacon', 'Sour cream'],
  };

  @override
  Widget build(BuildContext context) {
    final String imageUrl = mealImages.containsKey(mealName)
        ? mealImages[mealName]!
        : 'assets/oops.jpeg'; // Provide a default image if not found

    final List<String> ingredients = mealIngredients.containsKey(mealName)
        ? mealIngredients[mealName]!
        : [];

    return Scaffold(
      appBar: AppBar(
        title: Text(mealName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the image
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    imageUrl,
                    width: 200, // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
             const Center(
               child: Text(
                'Ingredients:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
             ),
            // Display the ingredients dynamically
            for (String ingredient in ingredients)
              Text('- $ingredient', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
