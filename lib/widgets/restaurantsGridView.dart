// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../lists/restaurantslist.dart';
// import '../models/subject.dart';
//
// class RestaurantsGridView extends StatefulWidget {
//   RestaurantsGridView(this.subjectList, {Key? key}) : super(key: key);
//   List<Restaurants> subjectList;
//
//   @override
//   State<RestaurantsGridView> createState() => _RestaurantsGridViewState();
// }
//
// class _RestaurantsGridViewState extends State<RestaurantsGridView> {
//   @override
//   Widget build(BuildContext context) {
//     String searchString = Provider.of<RestaurantList>(context).searchString;
//     List<Restaurants> subjectList = Provider.of<RestaurantList>(context).getRestaurantList().where((element) =>
//         element.Name.toLowerCase().contains(searchString)).toList();
//
//     return Container();
//   }
// }
