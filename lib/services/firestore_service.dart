import 'package:KurdTour/data/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/GeneralUser.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//read a stream of location to the screen
  Stream<List<Location>> streamOfJobs() {
    return _firebaseFirestore.collection('Location').snapshots().map(
          (v) => v.docs
              .map(
                (e) => Location.fromMap(e.data()),
              )
              .toList(),
        );
  }

  //adding a new job to firestore "jobs" collection
  Future<void> addNewLocation(Location location) async {
    await _firebaseFirestore
        .collection('Location')
        .add(location.toMap())
        .then((value) => debugPrint('success'))
        .onError((error, stackTrace) => debugPrint(error.toString()));
  }
}
