import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/restaurantsGridView.dart';
import '../widgets/searchbar.dart';
import 'cuisines_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homepage';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchString = "";
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text('Food Dash')
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchString = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
          ),
          //       SizedBox(height: 10),
          //       Container(
          //         child: (
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [Container(height: 500, child: RestaurantsGridView(RestaurantList.getRestaurantList())
          //         ),],
          //         )
          //         ),
          // ),
          Column(
            children: [
              Image.asset('images/fooddash.JPG',
                fit: BoxFit.cover,
                width: 400,
                height: 250,),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Cuisines",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context,
                        CuisinesScreen.routeName),
                    child: Text("View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      ),
      drawer: AppDrawer(),
    );
  }
}


