import 'package:KurdTour/favsreen/favscreen.dart';
import 'package:KurdTour/home_main/home_screen_main.dart';
import 'package:KurdTour/search_screen/serchvew.dart';
import 'package:flutter/material.dart';

import '../profilescreen/profilescreen.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMain> {
  int carrent = 0;
  int pageIndex = 0;

  final screens = [
    const HomeMainScreen(),
    const SerachScreen(),
    const FaveScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255)),
        home: Scaffold(
          body: screens[carrent],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 255, 156, 7),
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black45,
            showUnselectedLabels: true,
            iconSize: 30,
            currentIndex: carrent,
            onTap: (index) => setState(() => carrent = index),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Color.fromARGB(255, 255, 156, 7)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.find_in_page_outlined),
                  label: 'Search',
                  backgroundColor: Color.fromARGB(255, 255, 156, 7)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: 'Favoreate',
                  backgroundColor: Color.fromARGB(255, 255, 156, 7)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                  backgroundColor: Color.fromARGB(255, 255, 156, 7)),
            ],
          ),
        ));
  }
}
