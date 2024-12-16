// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Pages/cart.dart';
import 'package:grillmaster/Payment/ordersamary.dart';

class Deliver extends StatefulWidget {
  const Deliver({super.key});

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deliver to',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Progress Indicator
              Row(
                children: [
                  CircleAvatar(radius: 8, backgroundColor: Colors.green),
                  Expanded(
                    child: Container(height: 2, color: Colors.grey[300]),
                  ),
                  CircleAvatar(radius: 8, backgroundColor: Colors.grey[300]),
                  Expanded(
                    child: Container(height: 2, color: Colors.grey[300]),
                  ),
                  CircleAvatar(radius: 8, backgroundColor: Colors.grey[300]),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Enter Delivery Address",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Input Fields
              _buildTextField("Name"),
              const SizedBox(height: 10),
              _buildTextField("Address"),
              const SizedBox(height: 10),
              _buildTextField("City"),
              const SizedBox(height: 10),
              _buildTextField("Phone"),
              const SizedBox(height: 20),
              
              const SizedBox(height: 10),
              // Use Profile Details Section
              
              const SizedBox(height: 30),
              // Proceed Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Ordersamary()),
                      );
                    },
                    child: Text(
                      'Proceed',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextField Widget
  Widget _buildTextField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
