// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Login/login.dart';
import 'package:grillmaster/Pages/cart.dart';
import 'package:grillmaster/Pages/foods.dart';
import 'package:grillmaster/Pages/welcome.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 3;

  final List<Widget> _pages = [
    Welcome(),
    Food(),
    Cart(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/frame-bg-1.1.png'), // Replace with your actual image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0,5),
                        ),
                      ]
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/profile.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ), // For spacing
                  
                  SizedBox(height: 20),
                  ProfileInfoTile(
                    icon: Icons.person,
                    text: 'Ahmed',
                  ),
                  ProfileInfoTile(
                    icon: Icons.phone,
                    text: '13761849017',
                  ),
                  ProfileInfoTile(
                    icon: Icons.email,
                    text: 'info@dbestech.com',
                  ),
                  ProfileInfoTile(
                    icon: Icons.location_on,
                    text: 'Fill in the address',
                  ),
                  SizedBox(height: 10),
                  // SETTINGS
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: SizedBox(
                        width: 800,
                        height: 60,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.green[500],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 10),
                                blurRadius: 15, // Softness of the shadow
                                spreadRadius: 5, // How much the shadow spreads
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Edit Account',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // LOG OUT BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: SizedBox(
                        width: 800,
                        height: 60,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 79, 79),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 10),
                                blurRadius: 15, // Softness of the shadow
                                spreadRadius: 5, // How much the shadow spreads
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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

class ProfileInfoTile extends StatelessWidget {
  final IconData icon;
  final String text;

  // ignore: use_key_in_widget_constructors
  ProfileInfoTile({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 134, 134, 134).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.orange),
          title: Text(text, style: GoogleFonts.openSans()),
        ),
      ),
    );
  }
}
