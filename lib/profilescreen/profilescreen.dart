import 'package:flutter/material.dart';
import 'package:KurdTour/registar/login.dart';

import '../services/authentication.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.amber[500],
        ),
        body: Center(
          child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/avatar.png',
                    width: 200,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: const Text(
                      "User Name",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'giniraluser',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 180),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber[500],
                        minimumSize: const Size.fromHeight(45), // NEW
                      ),
                      onPressed: () {
                        AuthenticationHelper().signOut().then((value) =>
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login())));
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
