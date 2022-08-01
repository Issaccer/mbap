import 'package:flutter/material.dart';

import '../models/subject.dart';
import '../screens/View.dart';
import '../services/firestore_service.dart';

class CuisinesList extends StatefulWidget {

  @override
  State<CuisinesList> createState() => _CuisinesListState();
}

class _CuisinesListState extends State<CuisinesList> {
  FirestoreService fsService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Restaurants>>(
        stream: fsService.getRestaurants(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {
            return ListView.separated(
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(snapshot.data![i].Cuisines),
                    onTap: () => Navigator.pushNamed(context,
                        View.routeName, arguments: snapshot.data![i])
                );
              },
              itemCount: snapshot.data!.length,
              separatorBuilder: (ctx, i) {
                return Divider(height: 3, color: Colors.blueGrey);
              },
            );
          }
        }
    );
  }
}
