import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'loginScreen.dart';

void main() {
  print("This is being executed");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      );
  }
}
