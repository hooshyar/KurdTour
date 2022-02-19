import 'package:KurdTour/style_widget/card.dart';
import 'package:flutter/material.dart';

class SerachScreen extends StatefulWidget {
  const SerachScreen({Key? key}) : super(key: key);

  @override
  _SerachScreenState createState() => _SerachScreenState();
}

class _SerachScreenState extends State<SerachScreen> {
  var rating = 3.0;
  String imagee = 'assets/images/01.jpg';
  String titlee = 'new';
  String discription = 'dec';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                'Search And Filter',
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
                  const TextField(
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
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            )));
  }
}
