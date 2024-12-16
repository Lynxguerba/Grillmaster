// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unnecessary_to_list_in_spreads

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Controller/cartmodel.dart';
import 'package:provider/provider.dart';

class FoodDetail extends StatefulWidget {
  final String name;
  final String price;
  final String image;
  final String description;
  final int rating;

  const FoodDetail({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.rating,
  });

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quantity = 1;
  bool isFavorite = false; // Track favorite status

  // Convert price string to double for calculations
  double get itemPrice =>
      double.tryParse(widget.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;

  double get totalPrice => itemPrice * quantity;

  List<Map<String, dynamic>> comments = [
    {
      'username': 'MsTeam',
      'profileImage': 'assets/icons/profile.png',
      'comment': 'Wow! Yummy BBQ, I love this one.',
      'likes': 25,
      'dislikes': 5,
    },
    {
      'username': 'ExTRAMPS122222',
      'profileImage': 'assets/icons/app-icon.png',
      'comment': 'I think I need to order more, this is awesome!',
      'likes': 12,
      'dislikes': 2,
    },
  ];

  final TextEditingController _commentController = TextEditingController();

  // Function to add a new comment
  void _addComment(String commentText) {
    setState(() {
      comments.add({
        'username': 'NewUser', // Replace with dynamic user name if needed
        'profileImage': 'assets/icons/profile.png',
        'comment': commentText,
        'likes': 0,
        'dislikes': 0,
      });
    });
    _commentController.clear(); // Clear the input field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                floating: false,
                pinned: true,
                flexibleSpace: Stack(
                  children: [
                    FlexibleSpaceBar(
                      background: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 16,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });

                          if (isFavorite) {
                            // Add to favorites
                            Provider.of<CartModel>(context, listen: false)
                                .addToFavorites(
                              widget.name,
                              widget.price,
                              widget.image,
                              widget.description,
                              widget.rating,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Added to Favorites!')),
                            );
                          } else {
                            // Remove from favorites
                            Provider.of<CartModel>(context, listen: false)
                                .removeFromFavorites(widget.name);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('Removed from Favorites!')),
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.openSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < widget.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.price,
                          style: GoogleFonts.openSans(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                child: Text(
                                  '-',
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Text(
                                '$quantity',
                                style: GoogleFonts.openSans(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style: GoogleFonts.openSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Comments',
                          style: GoogleFonts.openSans(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        ...comments.map((comment) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage(comment['profileImage']),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment['username'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        comment['comment'],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                                Icons.thumb_up_alt_outlined),
                                            onPressed: () {
                                              setState(() {
                                                comment['likes']++;
                                              });
                                            },
                                          ),
                                          Text('${comment['likes']}'),
                                          IconButton(
                                            icon: Icon(
                                                Icons.thumb_down_alt_outlined),
                                            onPressed: () {
                                              setState(() {
                                                comment['dislikes']++;
                                              });
                                            },
                                          ),
                                          Text('${comment['dislikes']}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/icons/profile.png'),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      controller: _commentController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your comment...',
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_commentController
                                            .text.isNotEmpty) {
                                          FocusScope.of(context)
                                              .unfocus(); // Close keyboard
                                          _addComment(_commentController.text);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                      ),
                                      child: Text(
                                        'Add Comment',
                                        style: GoogleFonts.openSans(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -1),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: ₱${totalPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add the item to the cart
                      Provider.of<CartModel>(context, listen: false).addToCart(
                          widget.name, totalPrice, quantity, widget.image);

                      // Optional: Show a success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Item added to cart!')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Add to Cart',
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
