import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Payment/payment.dart';

class Ordersamary extends StatefulWidget {
  const Ordersamary({super.key});

  @override
  State<Ordersamary> createState() => _OrdersamaryState();
}

class _OrdersamaryState extends State<Ordersamary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Summary',style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display order items and totals
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Payment()),
              );
            },
            child: Text('Proceed to Payment'),
          ),
        ],
      ),
    );
  }
}