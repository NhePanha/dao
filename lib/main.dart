import 'package:applications_dao/app/view/register_screens/getstart_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OnboardingScreen(),
    );
  }
}
