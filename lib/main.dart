import 'package:flutter/material.dart';
import "AppBar.dart";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppBarTest(),
    );
  }
}
Controler.pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
