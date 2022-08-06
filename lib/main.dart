import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/screens/View.dart';
import 'package:fooddash/screens/add_favourites_screen.dart';
import 'package:fooddash/screens/cuisines_screen.dart';
import 'package:fooddash/screens/edit_favourites_screen.dart';
import 'package:fooddash/screens/favourites_list_screen.dart';
import 'package:fooddash/screens/homescreen.dart';
import 'package:fooddash/screens/menus_screens.dart';
import 'package:fooddash/screens/profilescreen.dart';
import 'package:fooddash/services/firestore_service.dart';
// import 'package:mbap_project/screens/restaurantdetails.dart';
import 'models/subject.dart';
import 'screens/reset_password_screen.dart';
import 'services/auth_service.dart';
import 'widgets/login_form.dart';
import 'widgets/register_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder (
        future: Firebase.initializeApp(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ?
            Center(child: CircularProgressIndicator()) :
            StreamBuilder<User?>(
          stream: authService.getAuthUser(),
          builder: (context, snapshot) {
            return MaterialApp(
      theme: ThemeData(
            primarySwatch: Colors.teal,
      ),
      home: MainScreen(),
      routes: {
            AddFavouritesScreen.routeName: (_) { return AddFavouritesScreen(); },
            FavouritesListScreen.routeName: (_) { return FavouritesListScreen(); },
            EditFavouritesScreen.routeName : (_) { return EditFavouritesScreen(); },
            HomeScreen.routeName : (_) { return HomeScreen(); },
            CuisinesScreen.routeName : (_) { return CuisinesScreen(); },
            View.routeName : (_) { return View(); },
            ProfileScreen.routeName : (_) { return ProfileScreen(); },
            ResetPasswordScreen.routeName : (_) { return ResetPasswordScreen(); },
            MenusScreen.routeName : (_) { return MenusScreen(); },
            // RestaurantsDetails.routeName : (_) { return RestaurantsDetails(); },
      }
    );
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

  bool loginScreen = true;

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
              // backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Food Dash'),
              ),
              body: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      loginScreen ? LoginForm() : RegisterForm(),
                      SizedBox(height: 5),
                      loginScreen ? TextButton(onPressed: () {
                        setState(() {
                          loginScreen = false;
                        });
                      }, child: Text('No account? Sign up here!')) :
                      TextButton(onPressed: () {
                        setState(() {
                          loginScreen = true;
                        });
                      }, child: Text('Existing user? Login in here!')),
                      loginScreen ? TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
                      }, child: Text('Forgotten Password')) : Center()
                    ],
                  )
              ),
            );
          }
    );
  }
}
