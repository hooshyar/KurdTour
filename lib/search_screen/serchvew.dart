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
      body: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: TextFormField(
                // initialValue: 'Input text',
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 54,
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  // Respond to button press
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber[500],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<Location> getCarWithPlateNumber(String title) async {
    return await _fireStore
        .collection('Location')
        .where('title', isEqualTo: title)
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
