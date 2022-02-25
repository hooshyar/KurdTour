import 'package:KurdTour/appview.dart';
import 'package:KurdTour/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print('initialized'));
  runApp(const AppView());
}
