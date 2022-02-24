import 'package:KurdTour/style_widget/card.dart';
import 'package:flutter/material.dart';

class FaveScreen extends StatefulWidget {
  const FaveScreen({Key? key}) : super(key: key);

  @override
  _FaveScreenState createState() => _FaveScreenState();
}

class _FaveScreenState extends State<FaveScreen> {
  String imagee = 'assets/images/01.jpg';
  String titlee = 'new';
  String discription = 'dec';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Favoreat',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.amber[500],
          ),
          body: Center(),
        ));
  }
}
