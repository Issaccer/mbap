// import 'package:flutter/material.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
//
// import '../models/subject.dart';
//
// class RestaurantsDetails extends StatefulWidget {
//   static String routeName = '/details';
//
//   @override
//   State<RestaurantsDetails> createState() => _RestaurantsDetailsState();
// }
//
// class _RestaurantsDetailsState extends State<RestaurantsDetails> {
//   @override
//   Widget build(BuildContext context) {
//     Restaurants selectedRestaurantList = ModalRoute.of(context)?.settings.arguments as Restaurants;
//
//     return Scaffold(
//       appBar: AppBar(
//           title: TextFormField(initialValue: selectedRestaurantList.Name,
//               style: Theme.of(context).textTheme.titleLarge)
//       ),
//       body: SlidingUpPanel(
//         panel: Center(
//       child: Container(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.network(selectedRestaurantList.image, height: 150),
//                   TextFormField(initialValue: selectedRestaurantList.Name),
//                 ],
//               ),
//               ),
//             ),
//         ),
//     );
//   }
// }
