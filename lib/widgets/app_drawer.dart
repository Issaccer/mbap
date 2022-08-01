
import 'package:flutter/material.dart';
import '../main.dart';
import '../screens/favourites_list_screen.dart';
import '../screens/homescreen.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
          AppBar(
            title: Text('Welcome!'),
            automaticallyImplyLeading: false,
      ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: ()=> Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
        ),
      Divider(height: 3,color: Colors.blueGrey),
      ListTile(
        leading: Icon(Icons.favorite),
        title: Text('Favourites'),
        onTap: ()=> Navigator.of(context).pushReplacementNamed(FavouritesListScreen.routeName),
      ),
      Divider(height: 3, color: Colors.blueGrey
      )],
      ),
    );
  }
}
