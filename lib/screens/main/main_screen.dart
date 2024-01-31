import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipes_app/screens/main/fav_foods_screen.dart';
import 'package:recipes_app/screens/main/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:recipes_app/screens/main/search_screen.dart';

// Main Screen
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currrentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Bottom navBar
      bottomNavigationBar: Container(
        color: Colors.grey.shade800,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            selectedIndex: 0,
            backgroundColor: Colors.grey.shade800,
            color: Colors.white,
            tabBackgroundColor: Colors.grey.shade300,
            padding: const EdgeInsets.all(20.0),
            gap: 10,
            tabs: [
              // Home button
              GButton(
                gap: 8,
                icon: (currrentTab == 0) ? Iconsax.home5 : Iconsax.home,
                iconActiveColor: Colors.lightBlue,
                text: 'Home',
              ),
              // Favorite button
              GButton(
                icon: (currrentTab == 1) ? Iconsax.heart5 : Iconsax.heart,
                iconActiveColor: Colors.red,
                text: 'Favorites',
              ),
              // Search button
              const GButton(
                gap: 8,
                icon: Iconsax.search_normal,
                iconActiveColor: Colors.lightBlue,
                text: 'Search',
              ),
            ],
            onTabChange: (index) {
              setState(() {
                currrentTab = index;
              });
            },
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: getPage(index: currrentTab),
      ),
    );
  }
}

Widget getPage({required int index}) {
  Widget widget = const HomeScreen();

  switch (index) {
    case 0:
      widget = const HomeScreen();
      break;

    case 1:
      widget = const FavoriteFoodScreen();
      break;

    case 2:
      widget = const SearchScreen();
      break;
  }
  return widget;
}
