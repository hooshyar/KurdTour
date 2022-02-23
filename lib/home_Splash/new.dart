import 'dart:async';

import 'package:KurdTour/home_main/home_bottom.dart';
import 'package:KurdTour/registar/login.dart';

import 'package:flutter/material.dart';

import '../locationDetiles/locationdetiles.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  // splash screen Will disappear after 5 seconds
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeMain())));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: Scaffold(
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 90),
              child: Center(
                child: Image.asset(
                  'assets/images/01.jpg',
                  height: 240,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 300),
                child: const Text('from wecode')),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/rwanga_logo.png',
                height: 60,
              ),
            )
          ],
        ),
      ),
    );
  }
}
