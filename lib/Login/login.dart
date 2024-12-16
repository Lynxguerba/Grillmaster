// lib/main.dart

// ignore_for_file: prefer_const_constructors, avoid_print, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grillmaster/Login/register.dart';
import 'package:grillmaster/Pages/profile.dart';
import 'package:grillmaster/Pages/welcome.dart';
import 'package:grillmaster/WelcomeScope/scope.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Scope()));
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/app-icon.png',
                  width: 300,
                  height: 200,
                ),
                SizedBox(height: 30),
                // Text(
                //   'Welcome! We\'re glad you\'re here!',
                //   style: TextStyle(fontSize: 20),
                // ),
                // SizedBox(height: 50),

                // TEXT FIELD EMAIL
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Email',
                      hintStyle: GoogleFonts.openSans(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // TEXT FIELD PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12)),
                      hintText: 'Password',
                      hintStyle: GoogleFonts.openSans(),
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // SIGNIN BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                      print("Sign In button tapped!");
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 220, 183),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26, // Shadow color
                            offset: Offset(0, 10), // Shadow position (x, y)
                            blurRadius: 15, // Blurring of the shadow
                            spreadRadius: 2, // How much the shadow spreads
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // REGISTER ACCOUNT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Have no Account?',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                        print("Register button tapped!");
                      },
                      child: Text(
                        ' Register Now!',
                        style: GoogleFonts.openSans(
                          color: Color.fromARGB(255, 255, 95, 27),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                // GOOGLE LOG IN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      minimumSize:
                          Size(double.infinity, 70), // Increase the height here
                    ),
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: const Color.fromARGB(255, 0, 133, 250),
                    ),
                    label: Text(
                      'Continue with Google',
                      style: GoogleFonts.openSans(fontSize: 18),
                    ),
                    onPressed: () {},
                    // onPressed: signIn,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   final user = await GoogleSignInApi.login();

  //   if (user == null) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text('No user is signed in.')));
  //   } else {
  //     // Pass the 'user' object to the WelcomePage
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => WelcomePage(user: user)));
  //   }
  // }
}
