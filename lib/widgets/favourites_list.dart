import 'package:flutter/material.dart';

import '../models/subject.dart';
import '../screens/edit_favourites_screen.dart';
import '../services/firestore_service.dart';

class FavouritesList extends StatefulWidget {

  @override
  State<FavouritesList> createState() => _FavouritesListState();
}

class _FavouritesListState extends State<FavouritesList> {
  FirestoreService fsService = FirestoreService();

  void removeItem(String id) {
    showDialog<Null>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure you want to remove from favourites?'),
            actions: [
              TextButton(onPressed: () {
                setState(() {
                  fsService.removeFavourites(id);
                });
                Navigator.of(context).pop();
              }, child: Text('Yes')),
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('No'))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Favourites>>(
        stream: fsService.getFavourites(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else {
            return ListView.separated(itemBuilder: (ctx, i) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text(snapshot.data![i].mode),),
                title: Text(snapshot.data![i].purpose),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeItem(snapshot.data![i].id);
                  },
                ),
                onTap: () => Navigator.pushNamed(context,
                    EditFavouritesScreen.routeName, arguments: snapshot.data![i]),
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
