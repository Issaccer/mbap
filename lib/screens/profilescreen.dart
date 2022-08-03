import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/main.dart';

import '../services/auth_service.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profile';

  // User currentUser;
  // MainScreen(this.currentUser);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  logOut() {
    AuthService authService = AuthService();

    return authService.logOut().then((value) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text('Logout successfully!'),));
    }).catchError((error) {
      FocusScope.of(context).unfocus();
      // String message = error.toString;
      // ScaffoldMessenger.of(context).hideCurrentSnackBar();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      // Text(message),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hello'),
              SizedBox(height:20),
              ElevatedButton(
                  onPressed: () { logOut(); Navigator.of(context).pushNamed(MainScreen.routeName);},
                  child: Text('Log out')
              )],
          ),
        ));
  }
}
