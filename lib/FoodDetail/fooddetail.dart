// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String description;

  const FoodDetail({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(name),
              background: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // To go back to the previous screen
              },
              child: Container(
                width: 30, // Set the width (circle size)
                height: 30, // Set the height (circle size)
                decoration: BoxDecoration(
                  color: Colors.white, // Circle background color
                  shape: BoxShape.circle, // Make the container circular
                ),
                child: Icon(
                  Icons.arrow_back, // Back arrow icon
                  color: Colors.black, // Arrow icon color
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Price: $price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
