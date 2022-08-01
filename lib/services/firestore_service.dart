import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/subject.dart';

class FirestoreService{

  Stream<List<Restaurants>> getRestaurants() {
    return FirebaseFirestore.instance
        .collection('restaurants')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Restaurants>((doc) => Restaurants.fromMap(doc.data(), doc.id))
        .toList());
  }

  addFavourites(purpose, mode) {
    return FirebaseFirestore.instance
        .collection('favourites')
        .add({'purpose': purpose, 'mode': mode});
  }
  removeFavourites(id) {
    return FirebaseFirestore.instance
        .collection('favourites')
        .doc(id)
        .delete();
  }
  Stream<List<Favourites>> getFavourites() {
    return FirebaseFirestore.instance
        .collection('favourites')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map<Favourites>((doc) => Favourites.fromMap(doc.data(), doc.id))
        .toList());
  }
  editFavourites(id, purpose, mode) {
    return FirebaseFirestore.instance
        .collection('favourites')
        .doc(id)
        .set({'purpose': purpose, 'mode': mode});
  }
}