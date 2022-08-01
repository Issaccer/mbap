import 'package:flutter/material.dart';
import '../models/subject.dart';
import '../services/firestore_service.dart';
import '../widgets/app_drawer.dart';
import '../widgets/favourites_list.dart';
import 'add_favourites_screen.dart';

class FavouritesListScreen extends StatelessWidget {
  static String routeName = '/favourites-list';
  @override
  Widget build(BuildContext context) {
    FirestoreService fsService = FirestoreService();

    return StreamBuilder<List<Favourites>>(
        stream: fsService.getFavourites(),
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting ?
          Center(child: CircularProgressIndicator()) :
          Scaffold(
            appBar: AppBar(
              title: Text('Favourites'),
            ),
            body: Container(
                alignment: Alignment.center,
                child: snapshot.data!.length > 0 ? FavouritesList() :
                Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset('images/empty.png', width: 300),
                    Text('No favourites yet, add one today!', style: Theme.of(context).textTheme.subtitle1,)
                  ],
                )),
            drawer: AppDrawer(),
            floatingActionButton: FloatingActionButton(
                onPressed: () {Navigator.of(context).pushNamed(AddFavouritesScreen.routeName);},
                child: Icon(Icons.add)
            ),
          );
        }
    );
  }
}
