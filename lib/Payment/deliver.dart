// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Controller/cartmodel.dart';
import 'package:grillmaster/Pages/cart.dart';
import 'package:grillmaster/Payment/ordersamary.dart';
import 'package:provider/provider.dart';

class Deliver extends StatefulWidget {
  const Deliver({super.key});

  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  // TextEditingControllers to collect input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free resources
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    phoneController.dispose();
    super.dispose();
  }

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
              _buildTextField("Name", nameController),
              const SizedBox(height: 10),
              _buildTextField("Address", addressController),
              const SizedBox(height: 10),
              _buildTextField("City", cityController),
              const SizedBox(height: 10),
              _buildTextField("Phone", phoneController),
              const SizedBox(height: 20),

              const SizedBox(height: 10),
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
                      if (_areFieldsValid()) {
                        final cartItems =
                            Provider.of<CartModel>(context, listen: false)
                                .cartItems;

                        // Collect delivery details from text controllers
                        final deliveryDetails = {
                          'name': nameController.text,
                          'address': addressController.text,
                          'city': cityController.text,
                          'phone': phoneController.text,
                        };

                        // Navigate to Order Summary and pass data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ordersamary(
                              orderDetails: cartItems,
                              deliveryDetails: deliveryDetails,
                            ),
                          ),
                        );
                      } else {
                        // Show error if any field is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please fill in all fields!',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
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
  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Check if all fields are filled
  bool _areFieldsValid() {
    return nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }
}
