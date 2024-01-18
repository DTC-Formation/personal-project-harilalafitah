import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:recipes_app/screens/main/fav_foods_screen.dart';
import 'package:recipes_app/screens/main/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int currrentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(
            (currrentTab == 0) ? Iconsax.home5 : Iconsax.home,
            color: (currrentTab == 0) ? Colors.lightBlue : Colors.white,
          ),
          Icon(
            (currrentTab == 1) ? Iconsax.heart5 : Iconsax.heart,
            color: (currrentTab == 1) ? Colors.red : Colors.white,
          ),
          Icon(
            (currrentTab == 2) ? Iconsax.star5 : Iconsax.star,
            color: (currrentTab == 2) ? Colors.lightBlue : Colors.white,
          ),
        ],
        color: Colors.grey.shade800,
        buttonBackgroundColor: Colors.grey.shade800,
        backgroundColor: Color.fromARGB(0, 1, 1, 1),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            currrentTab = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: getPage(index: currrentTab),
      ),
    );
  }
}

Widget getPage({required int index}) {
  Widget widget = HomeScreen();

  switch (index) {
    case 0:
      widget = HomeScreen();
      break;

    case 1:
      widget = FavoriteFoodScreen();
      break;

    case 2:
      widget = Scaffold();
      break;
  }
  return widget;
}
