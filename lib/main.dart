// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grillmaster/Controller/cartmodel.dart';
import 'package:grillmaster/WelcomeScope/scope.dart';
import 'package:provider/provider.dart'; // Import the CartModel

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(), // Provide the CartModel here
      child: MaterialApp(
        title: 'Grillmaster',
        debugShowCheckedModeBanner: false,
        home: Scope(), // Your app's entry screen
      ),
    );
  }
}
