import 'package:KurdTour/favsreen/favscreen.dart';
import 'package:KurdTour/data/generaluser.dart';
import 'package:KurdTour/search_screen/serchvew.dart';
import 'package:KurdTour/servis/firestore_service.dart';
import 'package:KurdTour/style_widget/card.dart';
import 'package:flutter/material.dart';
import '../locationDetiles/locationdetiles.dart';
import '../profilescreen/profilescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:KurdTour/data/location.dart';

class HomeMainScreen extends StatefulWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainScreen> {
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Location');
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Most important location',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber[500],
          ),
          body: Center(
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

                  return ListView.builder(
                      itemCount: _locations.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: generalcard(
                                image:
                                    'https://images.unsplash.com/photo-1547721064-da6cfb341d50',
                                titledoc: _locations[index].title,
                                discription: _locations[index].description,
                                ratingnew:_locations[index].rating),
                          ),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => LocationDetileView(
                                      loc: _locations[index]))),
                        );
                      });
                }),
          ),
        ));
  }

  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _fireStore.collection('Location').get();

    // Get data from docs and convert map to List

    //for a specific field
    final allData = querySnapshot.docs.map((doc) => doc.get('title')).toList();

    print(allData);
  }
}