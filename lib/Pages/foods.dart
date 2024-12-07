// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Pages/cart.dart';
import 'package:grillmaster/Pages/profile.dart';
import 'package:grillmaster/Pages/welcome.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  final PageController _pageController =
      PageController(); // PageView controller
  int _currentIndex = 1;

  final List<Widget> _pages = [
    Welcome(),
    Food(),
    Cart(),
    Profile(),
  ];

  final List<Map<String, String>> classic = [
    {
      'name': 'Betamax',
      'price': '₱1,500',
      'image': 'assets/menu/classic/betamax.jpg'
    },
    {
      'name': 'Chicken Wings',
      'price': '₱1,800',
      'image': 'assets/menu/classic/chicken-wing.jpg'
    },
    {
      'name': 'Isaw',
      'price': '₱1,200',
      'image': 'assets/menu/classic/isaw.jpg'
    },
    {
      'name': 'Pork Chop',
      'price': '₱1,200',
      'image': 'assets/menu/classic/pork-chop.jpg'
    },
  ];

  final List<Map<String, String>> seafoods = [
    {
      'name': 'Prawns',
      'price': '₱300',
      'image': 'assets/menu/seafood/grill-prawns.jpg'
    },
    {
      'name': 'Bangus',
      'price': '₱250',
      'image': 'assets/menu/seafood/bangus.jpg'
    },
    {
      'name': 'Hito',
      'price': '₱300',
      'image': 'assets/menu/seafood/hito.jpg'
    },
    {
      'name': 'Tambakol',
      'price': '₱250',
      'image': 'assets/menu/seafood/tambakol.jpg'
    },
  ];

  final List<Map<String, String>> saucy = [
    {
      'name': 'Liempo',
      'price': '₱150',
      'image': 'assets/menu/saucy/liempo.jpg'
    },
    {
      'name': 'Longganisa',
      'price': '₱200',
      'image': 'assets/menu/saucy/longanisa.jpg'
    },
    {
      'name': 'Meatballs',
      'price': '₱150',
      'image': 'assets/menu/saucy/meatballs.jpg'
    },
    {
      'name': 'Spareribs',
      'price': '₱200',
      'image': 'assets/menu/saucy/spareribs.png'
    },
  ];

  String selectedCategory = 'Classic';
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> displayItems;

    // Choose the list to display based on the selected category
    if (selectedCategory == 'Classic') {
      displayItems = classic;
    } else if (selectedCategory == 'Seafood') {
      displayItems = seafoods;
    } else {
      displayItems = saucy;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Our Menu',
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Classic Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Classic';
                    });
                  },
                  child: Text(
                    'Classic',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: selectedCategory == 'Classic'
                          ? Colors.orange
                          : Colors.grey,
                    ),
                  ),
                ),
                // Seafoods Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Seafood';
                    });
                  },
                  child: Text(
                    'Seafoods',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: selectedCategory == 'Seafood'
                          ? Colors.orange
                          : Colors.grey,
                    ),
                  ),
                ),
                // Saucy Button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = 'Saucy';
                    });
                  },
                  child: Text(
                    'Saucy',
                    style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: selectedCategory == 'Saucy'
                          ? Colors.orange
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 1, color: Colors.grey.shade300),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: displayItems.length,
                itemBuilder: (context, index) {
                  final item = displayItems[index];
                  return Container(
                    height: 250, // Set the height here
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              item['image']!,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            item['name']!,
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.bold, fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 4),
                          Text(
                            item['price']!,
                            style: GoogleFonts.openSans(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Expanded(
                            // Add this to make the remaining space flexible
                            child: IconButton(
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.orange),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
