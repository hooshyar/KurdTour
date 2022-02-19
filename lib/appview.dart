import 'package:KurdTour/home_Splash/new.dart';
import 'package:KurdTour/home_main/home_screen_main.dart';
import 'package:KurdTour/registar/login.dart';
import 'package:KurdTour/registar/signup.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 255, 255),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => Add(),
        '/homeScreen': (context) => const HomeMainScreen(),
      },
    );
  }
}
