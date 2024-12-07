// ignore_for_file: prefer_const_constructors, prefer_const_declarations, sized_box_for_whitespace, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Login/login.dart';
import 'package:grillmaster/Pages/welcome.dart';
// import 'package:grillmaster/Login/login.dart';

class Scope extends StatefulWidget {
  const Scope({super.key});

  @override
  State<Scope> createState() => _ScopeState();
}

class _ScopeState extends State<Scope> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildPageIndicator(int pageCount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          height: 12.0, // Adjusted size for better appearance
          width: 12.0,
          decoration: BoxDecoration(
            color:
                _currentPage == index ? Color(0xffC9A7A7) : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color:
                  _currentPage == index ? Color(0xffC9A7A7) : Color(0xffC9A7A7),
              width: 1.5, // Adjust border width as needed
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int numPages = 3; // Number of pages

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Frame-bg.png'),
                  fit: BoxFit.cover),
            ),
          ),
          PageView(
            controller: _pageController,
            children: [
              // SCOPE Page 1
              Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/Frame-bg.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the column takes only as much space as its children
                    children: [
                      Image.asset(
                        'assets/images/app-intro.png',
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(
                          height:
                              50), // Adds spacing between the image and text
                      Center(
                        child: Container(
                          width:
                              200, // Adjust the width to control text wrapping
                          child: Text(
                            'ORDER YOUR FOOD NOW',
                            textAlign: TextAlign
                                .center, // Centers the text within the container
                            style: GoogleFonts.openSans(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width:
                              300, // Adjust the width to control text wrapping
                          child: Text(
                            '"Quick, fresh, and straight from the grill to your doorstep. No waiting, just cravings satisfied!"',
                            textAlign: TextAlign
                                .center, // Centers the text within the container
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SCOPE Page 2
              Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage('assets/images/Frame-bg.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Ensures the column takes only as much space as its children
                    children: [
                      Image.asset(
                        'assets/images/app-intro1.png',
                        width: 300,
                        height: 300,
                      ),
                      SizedBox(
                          height:
                              50), // Adds spacing between the image and text
                      Center(
                        child: Container(
                          width:
                              200, // Adjust the width to control text wrapping
                          child: Text(
                            'CAREFULLY PREPARED',
                            textAlign: TextAlign
                                .center, // Centers the text within the container
                            style: GoogleFonts.openSans(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width:
                              300, // Adjust the width to control text wrapping
                          child: Text(
                            '"Carefully prepared, freshly grilled, and delivered hot—just for you!"',
                            textAlign: TextAlign
                                .center, // Centers the text within the container
                            style: GoogleFonts.openSans(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SCOPE Page 3
              Container(
                child: Stack(
                  children: [
                    // Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/scope-bg1.jpg'), // Replace with your desired image path
                          fit: BoxFit
                              .cover, // Ensures the image covers the entire container
                        ),
                      ),
                    ),
                    // Semi-Transparent Overlay
                    Container(
                      color: Colors.black.withOpacity(
                          0.6), // Adjust opacity as needed (0.0 - 1.0)
                    ),
                    // Content Layer
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Center(
                            child: Container(
                              width:
                                  300, // Adjust the width to control text wrapping
                              child: Text(
                                'DELIVERED TO YOU',
                                textAlign: TextAlign
                                    .center, // Centers the text within the container
                                style: GoogleFonts.openSans(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Container(
                              width:
                                  250, // Adjust width to control text wrapping
                              child: Text(
                                'Freshly grilled and delivered hot, satisfying your cravings anytime!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors
                                      .white, // Slightly lighter shade for subtitle
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          // GET STARTED BUTTON
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Welcome(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 10),
                                      blurRadius: 15, // Softness of the shadow
                                      spreadRadius:
                                          5, // How much the shadow spreads
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    'GET STARTED!',
                                    style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Page Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildPageIndicator(numPages),
          ),
        ],
      ),
    );
  }
}
