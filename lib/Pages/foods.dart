// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/frame-bg-1.1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ]),
    );
  }
}