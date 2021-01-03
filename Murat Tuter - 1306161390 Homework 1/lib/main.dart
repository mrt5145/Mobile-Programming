import 'package:flutter/material.dart';
import 'package:hw1/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework1',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.orange,
      ),
      home: HomeScreen(),
    );
  }
}
