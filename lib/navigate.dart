// Navigate.dart
import 'package:flutter/material.dart';
import 'package:recipe/favourite.dart';
import 'homescreen.dart';

class Navigate extends StatefulWidget {
  const Navigate({Key? key}) : super(key: key);

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int _currentPage = 0;

  late List<String> favoriteMeals;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    favoriteMeals = [];

    _pages = [
      HomeScreen(favoriteMeals: favoriteMeals, onFavoriteChanged: handleFavoriteChanged),
      Favourite(favoriteMeals: favoriteMeals),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
        ],
      ),
    );
  }

  void handleFavoriteChanged(String name) {
    setState(() {
      if (favoriteMeals.contains(name)) {
        favoriteMeals.remove(name);
      } else {
        favoriteMeals.add(name);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
