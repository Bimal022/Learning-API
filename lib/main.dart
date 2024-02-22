import 'package:flutter/material.dart';
import 'package:first_api/LoginController.dart';
import 'package:provider/provider.dart';

import 'loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginController(),
      child: MaterialApp(
        title: 'My App',
        home: LoginScreen(),
      ),
    );
  }
}