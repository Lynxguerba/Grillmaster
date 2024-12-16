// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Pages/welcome.dart';
import 'package:grillmaster/Payment/ordersamary.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedPaymentMethod = "Visa";
  bool isPayOnDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Ordersamary()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            const SizedBox(height: 20),
            Row(
              children: [
                CircleAvatar(radius: 8, backgroundColor: Colors.green),
                Expanded(
                  child: Container(height: 2, color: Colors.green),
                ),
                CircleAvatar(radius: 8, backgroundColor: Colors.green),
                Expanded(
                  child: Container(height: 2, color: Colors.green),
                ),
                CircleAvatar(radius: 8, backgroundColor: Colors.green),
              ],
            ),
            SizedBox(height: 20),

            Text(
              'Enter your Card Detail',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Card details
            if (!isPayOnDelivery)
              Column(
                children: [
                  _inputField(label: 'Card Number'),
                  _inputField(label: 'Name on Card'),
                  Row(
                    children: [
                      Expanded(child: _inputField(label: 'Expiry Date')),
                      SizedBox(width: 10),
                      Expanded(child: _inputField(label: 'Security Code')),
                    ],
                  ),
                ],
              ),

            Spacer(),

            // Complete order button
            _buildButton(
              context,
              "Complete Order",
              Colors.orange,
              Colors.white,
              () {
                _showThankYouDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethodIcon(String method, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
          isPayOnDelivery = false;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color:
                selectedPaymentMethod == method ? Colors.orange : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(assetPath, width: 50, height: 50),
      ),
    );
  }

  Widget _inputField({required String label}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Color bgColor,
      Color textColor, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          side: BorderSide(color: Colors.orange),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'THANK YOU',
            style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'The order has been placed successfully.',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()));
                  },
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}