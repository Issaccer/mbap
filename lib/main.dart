import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/screens/View.dart';
import 'package:fooddash/screens/add_favourites_screen.dart';
import 'package:fooddash/screens/cuisines_screen.dart';
import 'package:fooddash/screens/edit_favourites_screen.dart';
import 'package:fooddash/screens/favourites_list_screen.dart';
import 'package:fooddash/screens/homescreen.dart';
import 'package:fooddash/services/firestore_service.dart';
// import 'package:mbap_project/screens/restaurantdetails.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) => MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
      routes: {
        AddFavouritesScreen.routeName: (_) { return AddFavouritesScreen(); },
        FavouritesListScreen.routeName: (_) { return FavouritesListScreen(); },
        EditFavouritesScreen.routeName : (_) { return EditFavouritesScreen(); },
        HomeScreen.routeName : (_) { return HomeScreen(); },
        CuisinesScreen.routeName : (_) { return CuisinesScreen(); },
        View.routeName : (_) { return View(); },
        // RestaurantsDetails.routeName : (_) { return RestaurantsDetails(); },
      }
    ),
    );
  }
}

class MainScreen extends StatefulWidget {
  static String routeName = '/';
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    FirestoreService fsService = FirestoreService();

    return StreamBuilder<List<Favourites>>(
        stream: fsService.getFavourites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {}
            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Food Dash'),
              ),
            );
          }
    );
  }
}
