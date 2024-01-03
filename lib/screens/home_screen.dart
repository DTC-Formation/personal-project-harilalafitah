import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/home_app_bar.dart';
import 'package:recipes_app/widgets/home_search_bar.dart';
import 'package:recipes_app/widgets/quick_and_fast_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentCat = "All";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppBar(),
              SizedBox(height: 20.0),
              HomeSearchBar(),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/placeholder.jpg'),
                  ),
                ),
              ),
              // SizedBox(height: 20.0),
              // Text(
              //   'Categories',
              //   style: TextStyle(
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // SizedBox(height: 20.0),
              // Categories(currentCat: currentCat),
              SizedBox(height: 20.0),
              QuickAndFastList(),
              SizedBox(height: 30.0),
              Center(
                child: Text(
                  'More contents coming soon! >_- ',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
