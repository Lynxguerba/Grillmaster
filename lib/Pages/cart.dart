// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:grillmaster/Controller/cartmodel.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the CartModel
import 'package:grillmaster/Pages/foods.dart';
import 'package:grillmaster/Pages/profile.dart';
import 'package:grillmaster/Pages/welcome.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    Welcome(),
    Food(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Food()));
          },
        ),
        title: Text(
          'Your Order',
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/frame-bg-1.1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Cart Items
          Positioned.fill(
            child: Consumer<CartModel>(
              builder: (context, cartModel, child) {
                final cartItems = cartModel.cartItems;

                if (cartItems.isEmpty) {
                  return Center(
                    child: Text(
                      'Your cart is empty.',
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      10)), // Rounded corners for the top
                              child: Image.asset(
                                item['image'],
                                fit: BoxFit.cover,
                                width:
                                    double.infinity, // Full width of the card
                                height:
                                    100, // Adjust the height to your preference
                              ),
                            ),
                            ListTile(
                              title: Text(
                                item['name'],
                                style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '₱${item['totalPrice'].toStringAsFixed(2)}',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '${item['quantity']}x',
                                    style: GoogleFonts.openSans(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartModel.removeItem(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _pages[index]),
          );
          print("Navigated to index: $index");
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '', // Empty label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '', // Empty label
          ),
        ],
      ),
    );
  }
}
