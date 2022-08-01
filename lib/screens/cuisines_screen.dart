import 'package:flutter/material.dart';

import '../models/subject.dart';
import '../services/firestore_service.dart';
import '../widgets/cuisines_list.dart';

class CuisinesScreen extends StatelessWidget {
  static String routeName = '/cuisines';

  @override
  Widget build(BuildContext context) {
    FirestoreService fsService = FirestoreService();

    return  StreamBuilder<List<Restaurants>>(
        stream: fsService.getRestaurants(),
    builder: (context, snapshot) {
    return snapshot.connectionState ==
    ConnectionState.waiting
    ?
    Center(child: CircularProgressIndicator())
        :
    Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
    title: Text('Cuisines'),
    ),
    body: Container(alignment: Alignment.center,
    child: snapshot.data!.length > 0
    ? CuisinesList()
        :
    Column(
    ),
    ),
    );
    }
    );
  }
}


