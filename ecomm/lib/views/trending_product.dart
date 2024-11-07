import 'package:ecomm/constants/app_constants.dart';
import 'package:ecomm/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FlutterDeveloperHomePage extends StatefulWidget {
  @override
  _FlutterDeveloperHomePageState createState() =>
      _FlutterDeveloperHomePageState();
}

class _FlutterDeveloperHomePageState extends State<FlutterDeveloperHomePage> {
  final homeController = HomeController();
  var _selectedIndex = 1.obs;

  List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/hrx_shoes.png',
      'name': 'Black Winter...',
      'description': 'Autumn And Winter Casual cotton-padded jacket...',
      'price': '\u{20B9}499',
      'rating': 4.5,
      'reviews': '6,890'
    },
    {
      'image': 'assets/images/women_printed_kurta.png',
      'name': 'Flare Dress',
      'description':
          'Antheaa Black & Rust Orange Floral Print Tiered F...',
      'price': '\u{20B9}1,990',
      'rating': 4.5,
      'reviews': '3,35,566'
    },
    {
      'image': 'assets/images/watch.png',
      'name': 'Muscle Blaze...',
      'description': 'NUTRITIONAL POWERHOUSE: MuscleBl...',
      'price': '\u{20B9}3,900',
      'rating': 4.5,
      'reviews': '1,35,566'
    },
    {
      'image': 'assets/images/user_avater.png',
      'name': 'Sony PS4',
      'description':
          'Sony PS4 Console, 1TB Slim with 3 Games: Gran Turis...',
      'price': '\u{20B9}1,999',
      'rating': 4.5,
      'reviews': '8,35,566'
    },
    {
      'image': 'assets/images/women_printed_kurta.png',
      'name': 'Pink Embroide...',
      'description': 'EARTHEN Rose Pink Embroidered Tiered Max...',
      'price': '\u{20B9}1,900',
      'rating': 4.5,
      'reviews': '45,678'
    },
    {
      'image': 'assets/images/women_printed_kurta.png',
      'name': 'denim dress',
      'description':
          'Blue cotton denim dress Look 2 Printed cotton dr...',
      'price': '\u{20B9}999',
      'rating': 4.5,
      'reviews': '27,344'
    },
    {
      'image': 'assets/images/flat_and_heels.png',
      'name': 'Black Dress',
      'description':
          'Solid Black Dress for Women, Sexy Chain Shorts Ladi...',
      'price': '\u{20B9}2,000',
      'rating': 4.5,
      'reviews': '5,23,456'
    },
    {
      'image': 'assets/images/hrx_shoes.png',
      'name': 'men\'s & boys s...',
      'description': 'George Walker Derby Brown Formal Shoes',
      'price': '\u{20B9}999',
      'rating': 4.5,
      'reviews': '13,45,678'
    },
    {
      'image': 'assets/images/watch.png',
      'name': 'Realme 7',
      'description': '6 GB RAM | 64 GB ROM | Expandable Upto 256...',
      'price': '\u{20B9}3,499',
      'rating': 4.5,
      'reviews': '3,44,567'
    },
    {
      'image': 'assets/images/flat_and_heels.png',
      'name': 'Hot chocolate',
      'description': 'chocolate with ashwagandha and get a coconu...',
      'price': '\u{20B9}200',
      'rating': 4.5,
      'reviews': '6,23,569'
    },
    {
      'image': 'assets/images/hrx_shoes.png',
      'name': 'Black Jacket 12...',
      'description':
          'This warm and comfortable jacket is great for learni...',
      'price': '\u{20B9}2,999',
      'rating': 4.5,
      'reviews': '2,23,569'
    },
    {
      'image': 'assets/images/watch.png',
      'name': 'D7200 Digital C...',
      'description': 'D7200 Digital Camera (Nikon) In New Area...',
      'price': '\u{20B9}26,999',
      'rating': 4.5,
      'reviews': '67,456'
    },
    {
      'image': 'assets/images/hrx_shoes.png',
      'name': 'Jordan Stay',
      'description':
          'The classic Air Jordan 12 to create a shoe that’s fres...',
      'price': '\u{20B9}4,999',
      'rating': 4.5,
      'reviews': '10,23,456'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: IconButton(
            icon: Image.asset(
              'assets/icons/hamburger.png',
            ),
            onPressed: () {
              // Menu access functionality
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30,
            ),
            SizedBox(width: 10),
            
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avater.png'),
              ),
              onPressed: () {
                // Profile management functionality
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Image.asset(
                    'assets/icons/search.png',
                    height: 20,
                    width: 20,
                    color: Color(0xFFBBBBBB),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search any Product...',
                        hintStyle: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // Search functionality
                      },
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/icons/mic.png',
                      height: 24,
                      width: 24,
                      color: Color(0xFFBBBBBB),
                    ),
                    onPressed: () {
                      // Voice search functionality
                    },
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '52,082+ Items',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  onPressed: () {
                    // Sorting functionality
                  },
                  icon: Image.asset(
                    'assets/icons/sort.png',
                    height: 16,
                    width: 16,
                    color: Color(0xFF232327),
                  ),
                  label: Text(
                    'Sort',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Color(0xFF000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.black.withOpacity(0.08),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton.icon(
                  onPressed: () {
                    // Filtering functionality
                  },
                  icon: Image.asset(
                    'assets/icons/filter.png',
                    height: 16,
                    width: 16,
                    color: Color(0xFF232327),
                  ),
                  label: Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Color(0xFF000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 1,
                    shadowColor: Colors.black.withOpacity(0.08),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (164 / 245),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                var product = products[index];
                return GestureDetector(
                  onTap: () {
                    // Product card tap functionality
                  },
                  child: Container(
                    width: 164,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.asset(
                            product['image'],
                            height: 136,
                            width: 164,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            product['name'],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            product['description'],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 10,
                              color: Color(0xFF000000),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            product['price'],
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFECB30F),
                                size: 14,
                              ),
                              SizedBox(width: 4),
                              Text(
                                product['reviews'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 10,
                                  color: Color(0xFFA4A9B3),
                                ),
                              ),
                            ],
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
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 76.0,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.1),
            offset: Offset(0, -1),
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Obx(
        () => BottomNavigationBar(
          selectedItemColor: Color(0xFFE84B4B),
          unselectedItemColor: AppColors.blackColor,
          currentIndex: homeController.selectedIndex.value,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                AppIcons.home,
                width: 24.0,
                height: 24.0,
                color: homeController.selectedIndex.value == 0
                    ? Color(0xFFE84B4B)
                    : AppColors.blackColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppIcons.wishlist,
                width: 24.0,
                height: 24.0,
                color: homeController.selectedIndex.value == 1
                    ? Color(0xFFE84B4B)
                    : AppColors.blackColor,
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppIcons.search,
                width: 24.0,
                height: 24.0,
                color: homeController.selectedIndex.value == 2
                    ? Color(0xFFE84B4B)
                    : AppColors.blackColor,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                AppIcons.settings,
                width: 24.0,
                height: 24.0,
                color: homeController.selectedIndex.value == 3
                    ? Color(0xFFE84B4B)
                    : AppColors.blackColor,
              ),
              label: 'Setting',
            ),
          ],
          onTap: (index) {
            homeController.selectedIndex.value = index;
            // Handle navigation
          },
        ),
      ),
    );
  }

}