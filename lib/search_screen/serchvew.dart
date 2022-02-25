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
    ));
  }
}
