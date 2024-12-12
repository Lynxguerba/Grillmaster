// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Controller/fooddetail.dart';
import 'package:grillmaster/Pages/cart.dart';
import 'package:grillmaster/Pages/foods.dart';
import 'package:grillmaster/Pages/profile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController();
  // PageView controller
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Welcome(),
    Food(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      //   backgroundColor: Colors.transparent,
      // ),
      // drawer: Drawer(
      //   child: Container(
      //     color: Colors.orange,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         // User Profile Section
      //         DrawerHeader(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               CircleAvatar(
      //                 radius: 40,
      //                 backgroundImage: NetworkImage(
      //                   'https://example.com/your-profile-pic.jpg', // Replace with your image URL
      //                 ),
      //               ),
      //               SizedBox(height: 10),
      //               Text(
      //                 'Chinwe Uzegbu',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Text(
      //                 '[czuzegbu@gmail.com]',
      //                 style: TextStyle(
      //                   color: Colors.white70,
      //                   fontSize: 14,
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         // Menu Items
      //         ListTile(
      //           leading: Icon(Icons.person, color: Colors.white),
      //           title: Text('Profile', style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.shopping_cart, color: Colors.white),
      //           title: Text('My Orders', style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.policy, color: Colors.white),
      //           title: Text('Privacy Policy',
      //               style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.settings, color: Colors.white),
      //           title: Text('Settings', style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.help, color: Colors.white),
      //           title: Text('Help', style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.logout, color: Colors.white),
      //           title: Text('Sign Out', style: TextStyle(color: Colors.white)),
      //           onTap: () {},
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          // Static Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/frame-bg-1.1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Welcome Card
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 104, 104, 104)
                              .withOpacity(0.1),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Content (Text and Button)
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome!',
                                style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5),
                              RichText(
                                text: TextSpan(
                                  text: "Let's get ",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Grilling!',
                                      style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Food()));
                                  print('Order Now button pressed!');
                                },
                                child: Text(
                                  'Order Now',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right Content (Image)
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'assets/images/app-intro1.png',
                            height: 400,
                            width: 400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Scrollable Cards Section
                SizedBox(
                  height: 230, // Height for the cards
                  child: PageView(
                    controller: _pageController,
                    children: [
                      buildCard("Classic BBQ", "assets/images/classic-bbq.png",
                          4.5, "Juicy grilled BBQ with spices.", "15 mins"),
                      buildCard("Seafood BBQ", "assets/images/seafood-bbq.jpg",
                          3.0, "Fresh seafood platter.", "20 mins"),
                      buildCard("Saucy BBQ", "assets/images/saucy-bbq.png", 4.0,
                          "Sweet and tangy homemade.", "10 mins"),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Space between cards and dots
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    dotColor: Colors.grey.shade300,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                  ),
                ),

                // Popular Section and Items
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular',
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      buildFoodItem("Pork Chop", "Savory Grilled Perfection",
                          "80.00", "32min", 'assets/images/pork-chop.jpg', 5),
                      SizedBox(height: 16),
                      buildFoodItem(
                          "Chicken Wings",
                          "Spicy, Juicy, Crispy",
                          "50.00",
                          "30min",
                          'assets/images/chicken-wing.jpg',
                          5),
                      SizedBox(height: 16),
                      buildFoodItem("Bangus", "Delicate, Smoky, Zesty", "75.00",
                          "25min", 'assets/images/bangus.jpg', 5),
                      SizedBox(height: 16),
                      buildFoodItem(
                          "Grilled Prawns",
                          "Succulent and Savory",
                          "40.00",
                          "20min",
                          'assets/images/grill-prawns.jpg',
                          5),
                      SizedBox(height: 16),
                      buildFoodItem(
                          "BBQ Meatballs",
                          "Juicy and Glazed",
                          "50.00",
                          "18min",
                          'assets/images/bbq-meatballs.jpg',
                          5),
                    ],
                  ),
                ),
              ],
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

  Widget buildCard(String title, String imageUrl, double rating, String details,
      String prepTime) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        index < rating ? Icons.star : Icons.star_border,
                        color: Colors.orange,
                        size: 20,
                      );
                    }),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.fastfood,
                                color: Colors.orange, size: 20),
                            SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                details,
                                style: GoogleFonts.openSans(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time,
                              color: Colors.orange, size: 20),
                          SizedBox(width: 5),
                          Text(
                            prepTime,
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFoodItem(String title, String subtitle, String price, String time,
      String imageUrl, int rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetail(
              name: title,
              price: price,
              image: imageUrl,
              description: subtitle,
              rating: rating, // Pass the description as the subtitle
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: Offset(0, 2),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "₱$price",
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.red, size: 14),
                    SizedBox(width: 3),
                    Text(
                      time,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
