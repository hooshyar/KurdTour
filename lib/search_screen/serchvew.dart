import 'package:KurdTour/locationDetiles/locationdetiles.dart';
import 'package:KurdTour/style_widget/card.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:KurdTour/data/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';

class SerachScreen extends StatefulWidget {
  const SerachScreen({Key? key}) : super(key: key);

  @override
  _SerachScreenState createState() => _SerachScreenState();
}

TextEditingController _locationserch = TextEditingController();

class _SerachScreenState extends State<SerachScreen> {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Location');
  final _fireStore = FirebaseFirestore.instance;
  FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Search for Location',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.amber[500],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _locationserch,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Enter Location name',
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber[500],
                      minimumSize: const Size.fromHeight(45), // NEW
                    ),
                    onPressed: () {
                      getCarWithPlateNumber(_locationserch.toString());
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            )));
  }

  Future<Location> getCarWithPlateNumber(String titleloc) async {
    return await _fireStore
        .collection('Location')
        .where('title', isEqualTo: titleloc)
        .get()
        .then((snapshot) => snapshot.docs
            .map(
              (e) => Location.fromMap(
                e.data(),
              ),
            )
            .toList()
            .first);
  }
}
