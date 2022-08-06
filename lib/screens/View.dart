import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddash/screens/menus_screens.dart';
import '../models/subject.dart';

class View extends StatefulWidget {
  static String routeName = '/view';

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    Restaurants selectedRestaurantList = ModalRoute.of(context)?.settings.arguments as Restaurants;

    return Scaffold(
      appBar: AppBar(
        title: TextFormField(initialValue: selectedRestaurantList.Cuisines,
        style: Theme.of(context).textTheme.titleLarge)
      ),
      body: Container(
        child: Column(
    children: [
      Container(
        height: 200,
          width: 400,
          child: Image.network(selectedRestaurantList.imagebanner,
          fit: BoxFit.fill
          ),
      ),
      Divider(height: 10,),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Image.network(selectedRestaurantList.image, height: 150,),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, MenusScreen.routeName);
                },
                child: Text(selectedRestaurantList.Name),
        ),
        ],
      ),
      ),
        ],
    ),
      ),
    );
  }
}
// Container(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// GestureDetector(
// onTap: () => Navigator.pushNamed(context,
// RestaurantsDetails.routeName),
// child: Image.network(selectedRestaurantList.image, height: 150,),
// ),
// TextFormField(initialValue: selectedRestaurantList.Name),
// ],
// ),
// ),
