// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grillmaster/Controller/favorite.dart';
import 'package:grillmaster/Controller/fooddetail.dart';
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
      'price': '₱10.00',
      'image': 'assets/menu/classic/betamax.jpg',
      'rating': '4',
      'description':
          'Betamax is a beloved Filipino street food made from cubed, solidified chicken blood that is skewered and grilled to smoky perfection. Its unique flavor comes from a subtle blend of the iron-rich taste of blood paired with the charred, savory aroma of the grill. Often served with a tangy vinegar dip or spicy sauce, Betamax is not just a snack but an adventurous culinary experience that embodies the rich and resourceful heritage of Filipino cuisine.',
    },
    {
      'name': 'Chicken Wings',
      'price': '₱50.00',
      'image': 'assets/menu/classic/chicken-wing.jpg',
      'rating': '5',
      'description':
          'Chicken Wings BBQ is a crowd-pleasing favorite, featuring juicy and tender chicken wings marinated in a flavorful blend of spices and seasonings. Slowly grilled over charcoal, each wing boasts a smoky aroma, crispy edges, and a juicy interior bursting with savory goodness. Perfectly glazed with your choice of classic BBQ, sweet honey, or spicy sauce, these wings offer a delectable combination of flavors that are sure to satisfy every craving'
    },
    {
      'name': 'Isaw',
      'price': '₱10.00',
      'image': 'assets/menu/classic/isaw.jpg',
      'rating': '5',
      'description':
          'Isaw is a popular Filipino street food that transforms humble chicken intestines into a smoky and savory delicacy. Marinated in a tangy blend of vinegar, soy sauce, garlic, and spices, each skewer is carefully grilled over charcoal to achieve a perfect balance of crispness and tenderness. Served with a dipping sauce of spiced vinegar or sweet barbecue glaze, Isaw offers an irresistible burst of bold flavors and textures, making it a must-try treat for street food lovers.'
    },
    {
      'name': 'Pork Chop',
      'price': '₱80.00',
      'image': 'assets/menu/classic/pork-chop.jpg',
      'rating': '5',
      'description':
          'Pork Chop BBQ is a hearty and flavorful dish featuring thick, bone-in pork chops marinated in a special blend of soy sauce, calamansi, garlic, and spices. Grilled to golden perfection over hot charcoal, each chop boasts a crispy charred exterior while remaining juicy and tender on the inside. Paired with a smoky aroma and a savory, tangy flavor, this classic barbecue favorite is perfect as a satisfying meal or a crowd-pleasing addition to any gathering.'
    },
    {
      'name': 'Proben',
      'price': '₱10.00',
      'image': 'assets/menu/classic/proben.jpg',
      'rating': '3',
      'description':
          'Proben is a unique and crispy Filipino street food made from chicken proventriculus, a part of the digestive system. The tender meat is coated in a light, seasoned batter and deep-fried to golden perfection, creating a crunchy exterior that contrasts beautifully with the juicy, flavorful interior. Often served hot off the fryer with a side of spiced vinegar or a sweet chili dip, Proben is a delightful snack that offers a satisfying crunch in every bit  e.'
    },
  ];

  final List<Map<String, String>> seafoods = [
    {
      'name': 'Prawns',
      'price': '₱40.00',
      'image': 'assets/menu/seafood/grill-prawns.jpg',
      'rating': '5',
      'description':
          'Grilled Prawns are a luxurious treat, featuring plump and juicy prawns brushed with a flavorful marinade of garlic, butter, and a hint of lemon. Carefully grilled over charcoal, these prawns develop a smoky aroma and a slightly charred, caramelized exterior that enhances their natural sweetness. Served with a side of zesty dipping sauce or a squeeze of fresh calamansi, Grilled Prawns are a perfect balance of savory, smoky, and refreshing flavors, making them a highlight of any barbecue feast.'
    },
    {
      'name': 'Bangus',
      'price': '₱75.00',
      'image': 'assets/menu/seafood/bangus.jpg',
      'rating': '5',
      'description':
          'Grilled Bangus, the national fish of the Philippines, is a flavorful and healthy barbecue option that showcases the rich, tender meat of milkfish. Butterflied and marinated in a tangy blend of vinegar, garlic, and spices, the fish is grilled to perfection, creating a beautifully charred skin and a moist, flaky interior. Often stuffed with tomatoes, onions, and herbs, Grilled Bangus offers a delightful medley of smoky, savory, and slightly tangy flavors, making it a centerpiece dish for any Filipino feast.'
    },
    {
      'name': 'Hito',
      'price': '₱300',
      'image': 'assets/menu/seafood/hito.jpg',
      'rating': '3',
      'description':
          'Grilled Hito is a beloved Filipino dish known for its rich, bold flavors and succulent texture. Fresh catfish is marinated in a mix of calamansi juice, soy sauce, garlic, and black pepper, then grilled over charcoal until the skin is perfectly crisp and the meat tender and flaky. Its natural sweetness is complemented by a smoky aroma and is best enjoyed with a side of spiced vinegar or fresh green mango salad. A classic dish that’s both hearty and satisfying, Grilled Hito captures the essence of traditional Filipino barbecue.'
    },
    {
      'name': 'Tambakol',
      'price': '₱120.00',
      'image': 'assets/menu/seafood/tambakol.jpg',
      'rating': '4',
      'description':
          'Grilled Tambakol is a hearty and flavorful dish featuring thick, juicy cuts of yellowfin tuna steak, marinated in a savory blend of calamansi, soy sauce, garlic, and black pepper. Grilled over hot charcoal, each piece develops a beautiful char while maintaining its tender, flaky texture and rich, meaty flavor. Best served with a side of fresh tomatoes, onions, and a spiced vinegar dipping sauce, Grilled Tambakol is a wholesome and satisfying dish that highlights the bold, smoky taste of the ocean.'
    },
  ];

  final List<Map<String, String>> saucy = [
    {
      'name': 'Liempo',
      'price': '₱150.00',
      'image': 'assets/menu/saucy/liempo.jpg',
      'rating': '5',
      'description':
          'Liempo is a mouthwatering Filipino favorite, featuring tender and juicy pork belly marinated in a mixture of soy sauce, garlic, calamansi, and a secret blend of spices. Grilled to perfection, the pork belly develops a crispy, caramelized skin while retaining its rich and flavorful meat. The smoky aroma from the charcoal grill enhances the savory and slightly tangy taste, making each bite irresistible. Often served with a side of spicy vinegar or a rich dipping sauce, Grilled Liempo is a true Filipino barbecue classic that’s sure to satisfy every craving.'
    },
    {
      'name': 'Longganisa',
      'price': '₱40.00',
      'image': 'assets/menu/saucy/longanisa.jpg',
      'rating': '0',
      'description':
          'Longganisa is a delightful Filipino sausage that’s a breakfast staple and a barbecue favorite. Made with ground pork marinated in a blend of garlic, vinegar, sugar, and a medley of aromatic spices, this sausage boasts a perfect balance of sweet, savory, and garlicky flavors. Grilled or pan-fried to achieve a caramelized and smoky exterior, each bite is bursting with mouthwatering goodness. The irresistible aroma and juicy, flavorful meat make Longganisa a dish you’ll keep coming back for. Traditionally served with garlic fried rice, a sunny-side-up egg, and a side of tangy vinegar dipping sauce, it’s a Filipino classic that’s perfect for any time of the day.'
    },
    {
      'name': 'Meatballs',
      'price': '₱50.00',
      'image': 'assets/menu/saucy/meatballs.jpg',
      'rating': '5',
      'description':
          'Meatballs are a comforting and satisfying favorite, featuring tender, hand-rolled balls of seasoned ground pork or beef mixed with breadcrumbs, garlic, onion, and a secret blend of spices. Cooked to golden perfection, these juicy delights are packed with rich, savory flavors and a hint of herbs that elevate every bite. Whether grilled for a smoky aroma or simmered in a tangy tomato sauce, meatballs are versatile and bursting with taste. Often served with steamed rice, pasta, or as a flavorful snack with a zesty dipping sauce, this timeless dish is a crowd-pleaser that’s perfect for any meal or gathering.'
    },
    {
      'name': 'Spareribs',
      'price': '₱50.00',
      'image': 'assets/menu/saucy/spareribs.jpg',
      'rating': '2',
      'description':
          'Spareribs are a barbecue lover’s dream, featuring tender and juicy pork ribs marinated in a rich blend of soy sauce, garlic, brown sugar, and a hint of tangy calamansi. Grilled low and slow over charcoal, the ribs develop a perfectly caramelized glaze with a smoky aroma that enhances their deep, savory-sweet flavor. The meat is so tender it falls off the bone with every bite, leaving a satisfying burst of barbecue goodness. Served with a side of spicy vinegar, coleslaw, or steaming garlic rice, these spareribs are a Filipino barbecue classic that’s sure to delight every rib enthusiast.'
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
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Welcome()));
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Favorite()));
              print('Favorite Food Added!');
            },
          ),
        ],
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
                    final String? ratingStr = item['rating'];
                    final int rating =
                        ratingStr != null ? int.tryParse(ratingStr) ?? 0 : 0;

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetail(
                              name: item['name']!,
                              price: item['price']!,
                              image: item['image']!,
                              description: item['description']!,
                              rating: rating,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 270,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (starIndex) => Icon(
                                    starIndex < rating
                                        ? Icons.star
                                        : Icons.star_border_outlined,
                                    color: rating > 0
                                        ? Colors.orange
                                        : Colors.grey,
                                    size: 16,
                                  ),
                                ),
                              ),
                              if (rating ==
                                  0) // Add this to display "No Ratings Yet"
                                Text(
                                  'No Ratings Yet',
                                  style: GoogleFonts.openSans(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
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
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
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
