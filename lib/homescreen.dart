import 'package:flutter/material.dart';

import 'meals.dart';

class HomeScreen extends StatefulWidget {
  final List<String> favoriteMeals;
  final void Function(String) onFavoriteChanged;

  const HomeScreen({
    Key? key,
    required this.favoriteMeals,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late List<String> allRecipes;
  late List<String> displayedRecipes;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(); // Initialize _searchController
    allRecipes = ['Burger', 'Pizza', 'Shawarma', 'Fries', 'Sandwich'];
    displayedRecipes = allRecipes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Search',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'What is in your kitchen',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Enter some ingredients'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextFormField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Type your ingredients',
                  focusColor: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text('What do you want to make today.......'),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                children: _buildRecipeCards(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      displayedRecipes = allRecipes
          .where((recipe) => recipe.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  List<Widget> _buildRecipeCards() {
    return displayedRecipes.map((recipe) {
      return MealCard(
        name: recipe,
        imgUrl: 'assets/$recipe.jpg', // Assuming image names are consistent with recipe names
        onTap: () => handleonTap(context, recipe),
        isFavorite: widget.favoriteMeals.contains(recipe),
        onFavoriteChanged: () => handleFavoriteChanged(recipe),
      );
    }).toList();
  }

  void handleonTap(BuildContext context, String name) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Meals(mealName: name)),
    );
  }

  void handleFavoriteChanged(String name) {
    widget.onFavoriteChanged(name);
  }
}

class MealCard extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  final String imgUrl;
  final bool isFavorite;
  final VoidCallback onFavoriteChanged;

  MealCard({
    Key? key,
    required this.name,
    required this.onTap,
    required this.imgUrl,
    required this.isFavorite,
    required this.onFavoriteChanged,
  }) : super(key: key);

  @override
  State<MealCard> createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            Row(
              children: [
                Text(widget.name, style: const TextStyle(color: Colors.black)),
                const Spacer(),
                InkWell(
                  onTap: widget.onFavoriteChanged,
                  child: widget.isFavorite
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                ),
              ],
            ),
            SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.asset(
                widget.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
