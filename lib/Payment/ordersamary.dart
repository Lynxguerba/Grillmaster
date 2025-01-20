// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Payment/payment.dart';

class Ordersamary extends StatelessWidget {
  final List<Map<String, dynamic>> orderDetails;
  final Map<String, String> deliveryDetails;

  const Ordersamary({
    Key? key,
    required this.orderDetails,
    required this.deliveryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate Subtotal
    double subtotal = 0;
    for (var item in orderDetails) {
      subtotal += item['totalPrice'];
    }

    // Define the delivery fee
    double deliveryFee = 100.0;

    // Calculate the total amount payable
    double amountPayable = subtotal + deliveryFee;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Summary',
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
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
                  child: Container(height: 2, color: Colors.green),
                ),
                CircleAvatar(radius: 8, backgroundColor: Colors.green),
                Expanded(
                  child: Container(height: 2, color: Colors.grey[300]),
                ),
                CircleAvatar(radius: 8, backgroundColor: Colors.grey[300]),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Delivery Details",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text("Name: ${deliveryDetails['name']}"),
            Text("Address: ${deliveryDetails['address']}"),
            Text("City: ${deliveryDetails['city']}"),
            Text("Phone: ${deliveryDetails['phone']}"),
            const Divider(height: 30, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              "Order Details",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: orderDetails.length,
                itemBuilder: (context, index) {
                  final item = orderDetails[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Image Section
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.asset(
                            item[
                                'image'], // Ensure this key exists in the orderDetails map
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Details Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Center align horizontally
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Center align vertically
                            children: [
                              Text(
                                item['name'],
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Quantity: ${item['quantity']}",
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        // Price Section (Aligned to the right)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Align(
                            alignment:
                                Alignment.centerRight, // Align to the right
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment
                                  .end, // Align text to the right
                              children: [
                                Text(
                                  "₱${item['totalPrice'].toStringAsFixed(2)}",
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Optional spacing
                      ],
                    ),
                  );
                },
              ),
            ),

            // Subtotal Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Subtotal:",
                    style: GoogleFonts.openSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₱${subtotal.toStringAsFixed(2)}",
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Delivery Fee Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Fee:",
                    style: GoogleFonts.openSans(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "₱${deliveryFee.toStringAsFixed(2)}",
                    style: GoogleFonts.openSans(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Amount Payable Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Amount Payable:",
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "₱${amountPayable.toStringAsFixed(2)}",
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Payment()));
                  },
                  child: Text(
                    'Proceed to Payment',
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
    );
  }
}
