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

  String? _searchQuery;

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
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value.toLowerCase();
                  });
                },
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Location Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _fireStore.collection("Location").snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LinearProgressIndicator();
                    }
                    List<Location> _locations = snapshot.data!.docs
                        .map((e) =>
                            Location.fromMap(e.data() as Map<String, dynamic>))
                        .toList();
                    if (_searchQuery != null) {
                      _locations = _locations
                          .where((element) => element.title!
                              .toLowerCase()
                              .contains(_searchQuery!.toLowerCase()))
                          .toList();
                    }
                    return ListView.builder(
                        itemCount: _locations.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: generalcard(
                                  image: _locations[index].image,
                                  titledoc: _locations[index].title,
                                  discription: _locations[index].description,
                                  ratingnew: _locations[index].rating),
                            ),
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => LocationDetileView(
                                        loc: _locations[index]))),
                          );
                        });
                  }),
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
