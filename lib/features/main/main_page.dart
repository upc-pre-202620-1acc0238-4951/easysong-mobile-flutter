import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const new({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<String> views = ["Home", "Favorites", "Cart"];

  final Map<String, List<Icon>> icons = {
  "Home": [Icon(Icons.home), Icon(Icons.home_outlined)],
  "Favorites": [Icon(Icons.favorite), Icon(Icons.favorite_outline)],
  "Cart": [Icon(Icons.shopping_cart), Icon(Icons.shopping_cart_outlined)],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text(views[selectedIndex])),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        destinations: [
          for (var view in views) 
            NavigationDestination(
              selectedIcon: icons[view]![0],
              icon: icons[view]![1],
              label: view,
            )
        ],
      ),
    );
  }
}
