import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Controller/cartmodel.dart';
import 'package:grillmaster/Payment/deliver.dart';
import 'package:grillmaster/Payment/payment.dart';
import 'package:provider/provider.dart';

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
          onPressed: () {
            final cartItems =
                Provider.of<CartModel>(context, listen: false).cartItems;
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Deliver()));
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
              // Order Details
              Text(
                "Order details",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              _buildOrderItem("Betamax", "10.00 x 1", "₱10.00",
                  "assets/menu/classic/betamax.jpg"),
              _buildOrderItem("Bangus", "75.00 x 1", "₱75.00",
                  "assets/menu/seafood/bangus.jpg"),
              _buildOrderItem("Spareribs", "50.00 x 1", "₱50.00",
                  "assets/menu/saucy/spareribs.jpg"),
              const Divider(),
              _buildPriceRow("Sub total:", "₱135.00"),
              _buildPriceRow("Delivery fee:", "₱100.00"),
              const SizedBox(height: 5),
              _buildPriceRow("Amount payable:", "₱235.00", isBold: true),
              const SizedBox(height: 20),
              // Delivery Address
              Text(
                "Delivery Address",
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              _buildDeliveryAddress(),
              const SizedBox(height: 30),

              const SizedBox(height: 10),
              _buildButton(
                  context, "Proceed to payment", Colors.orange, Colors.white,
                  () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Payment()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Order Item Widget
  Widget _buildOrderItem(
      String name, String quantity, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.openSans(fontSize: 14)),
                Text(quantity,
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          Text(price, style: GoogleFonts.openSans(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Price Row Widget
  Widget _buildPriceRow(String title, String amount, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          amount,
          style: GoogleFonts.openSans(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // Delivery Address Widget
  Widget _buildDeliveryAddress() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAddressRow("Name:", "Sample Exmaple"),
          _buildAddressRow("Address:", "Roxas"),
          _buildAddressRow("City:", "Davao City"),
          _buildAddressRow("Phone:", "0908384040"),
        ],
      ),
    );
  }

  Widget _buildAddressRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Button Widget
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
}
