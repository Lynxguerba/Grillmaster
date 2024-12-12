import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        title: Text('Deliver to', style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input fields and profile selection UI
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ordersamary()),
              );
            },
            child: Text('Proceed'),
          ),
        ],
      ),
    );
  }
}