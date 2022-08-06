// import 'package:flutter/material.dart';
// import 'package:fooddash/screens/menus_screens.dart';
//
// import '../models/subject.dart';
// import '../services/firestore_service.dart';
//
// class MenusList extends StatefulWidget {
//
//   @override
//   State<MenusList> createState() => _MenusListState();
// }
//
// class _MenusListState extends State<MenusList> {
//   FirestoreService fsService = FirestoreService();
//   Menus selectedMenus = ModalRoute.of(context)?.settings.arguments as
//   Menus;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Menus>>(
//         stream: fsService.getMenus(selectedMenus.Cuisines),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting)
//             return Center(child: CircularProgressIndicator());
//           else {
//             return ListView.separated(
//               itemBuilder: (ctx, i) {
//                 return ListTile(
//                     title: GestureDetector(
//                       onTap: () {
//                         Navigator.pushNamed(context, MenusScreen.routeName);
//                       },
//                       child: Text(snapshot.data![i].Cuisines)
//                     ),
//                     trailing: IconButton(
//                 icon: Icon(Icons.border_color_rounded),
//                 onPressed: () => Navigator.pushNamed(context,
//                 MenusScreen.routeName, arguments: snapshot.data![i])
//                 ),
//                 );
//               },
//               itemCount: snapshot.data!.length,
//               separatorBuilder: (ctx, i) {
//                 return Divider(height: 3, color: Colors.blueGrey);
//               },
//             );
//           }
//         }
//     );
//   }
// }
