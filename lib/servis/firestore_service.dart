import 'package:KurdTour/data/generaluser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

//read a stream of location to the screen
  /* Stream<List<Location>> streamOfLocation() {
    return _firebaseFirestore.collection('Location').snapshots().map(
          (v) => v.docs
              .map(
                (e) => Job.fromMap(e.data()),
              )
              .toList(),
        );
  }
*/
}
