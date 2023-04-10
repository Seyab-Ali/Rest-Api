import 'package:flutter/material.dart';
import 'package:rest_api/Models/example_five.dart';
import 'package:rest_api/example_two.dart';
import 'package:rest_api/signup.dart';

import 'example_four.dart';
import 'example_three.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

