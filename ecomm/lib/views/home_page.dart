import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../constants/app_constants.dart';
import 'category_item.dart';
import 'product_card.dart';
import 'trending_product.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/icons/hamburger.png',
                width: 24, // Adjust width and height as needed
                height: 24,
              ),
              title: Text('Home'),
              onTap: () {},
            ),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72.0),
        child: Padding(
          padding:
              EdgeInsets.only(top: 70.0), // Increased top padding from 16 to 32
          child: _buildHeader(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 16.0), // Added top padding here
          children: [
            _buildSearchBar(),
            _buildFeaturedSection(),
            _buildCategories(),
            _buildPromoBanner(),
            SizedBox(height: 16.0),
            _buildDealOfTheDay(),
            SizedBox(height: 16.0),
            _buildProductCarousel(),
            SizedBox(height: 16.0),
            _buildSpecialOffers(),
            SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Logo
            Center(
            child: Container(
              width: 300,
              height: 300,
              child: Center(
              child: Image.asset(
                AppImages.logo,
                width: 220,
                height: 108,
              ),
              ),
            ),
            ),
          // Menu Icon
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: () {
                Scaffold.of(Get.context!).openDrawer();
              },
              child: Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    AppIcons.hamburger,
                    width: 28.0,
                    height: 28.0,
                  ),
                ),
              ),
            ),
          ),
          // Profile Icon
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage(AppImages.userAvatar),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 40.0,
        margin: EdgeInsets.only(top: 2.0),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.04),
              offset: Offset(0, 2),
              blurRadius: 9.0,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 8.0),
            Image.asset(
              AppIcons.search,
              width: 20.0,
              height: 20.0,
              color: AppColors.greyColor,
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search any Product..',
                  hintStyle: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppIcons.mic,
                width: 24.0,
                height: 24.0,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Obx(
      () => Container(
        height: 100.0,
        margin: EdgeInsets.symmetric(vertical: 16.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeController.categories.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                if (index == 0) SizedBox(width: 16.0),
                GestureDetector(
                  onTap: () {
                    homeController.selectedIndex.value = index;
                  },
                  child: CategoryItem(
                    category: homeController.categories[index],
                  ),
                ),
                SizedBox(width: 16.0),
              ],
            );
          },
        ),
      ),
    );
  }

Widget _buildPromoBanner() {
  const List<String> imageList = [
    'assets/images/banner2.png',
    'assets/images/banner1.png',
    'assets/images/banner3.png',
  ];
  
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.0),
    child: CarouselSlider(
      options: CarouselOptions(
        height: 189.0,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        enableInfiniteScroll: true,
        autoPlay: true,
      ),
      items: imageList.map((item) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0), // Add space between images
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            item, 
            fit: BoxFit.cover, 
            width: double.infinity
          ),
        ),
      )).toList(),
    ),
  );
}

  Widget _buildDealOfTheDay() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16.0,
              top: 10.0,
              child: Text(
                'Deal of the Day',
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 16.0,
              bottom: 10.0,
              child: Row(
                children: [
                  Icon(
                    Icons.access_alarms,
                    color: AppColors.whiteColor,
                    size: 16.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    '22h 55m 20s remaining',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 12.0,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16.0,
              top: 8.0,
              child: OutlinedButton(
                onPressed: () => Get.to(FlutterDeveloperHomePage()),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.whiteColor,
                  side: BorderSide(color: AppColors.whiteColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 16.0,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _buildProductCarousel() {
  return Obx(() {
    if (homeController.isLoading.value) {
      return Center(child: CircularProgressIndicator());
    } else if (homeController.products.isEmpty) {
      return Center(child: Text('No products available.'));
    }
    return Container(
      height: 250, // Set the height according to your design
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: homeController.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ProductCard(product: homeController.products[index]),
          );
        },
      ),
    );
  });
}
  Widget _buildSpecialOffers() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 97.0,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            SizedBox(width: 8.0),
            Image.asset(
              AppImages.specialOffer,
              width: 80.0,
              height: 60.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Special Offers',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(9.0),
                            border: Border.all(
                              color: AppColors.blackColor.withOpacity(0.15),
                              width: 1.0,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.1),
                                offset: Offset(-0.25, -0.75),
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.2),
                                offset: Offset(0, 0.25),
                                blurRadius: 0.75,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              '\u{1F631}',
                              style: TextStyle(
                                fontSize: 10.5,
                                fontFamily: 'Arimo',
                                fontWeight: FontWeight.w700,
                                color: AppColors.blackColor.withOpacity(0.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'We make sure you get the offer you need at best prices',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
Widget _buildFeaturedSection() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // All Featured Title
        Text(
          'All Featured',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
            color: AppColors.blackColor,
          ),
        ),
        // Sort and Filter Buttons
        Row(
          children: [
            GestureDetector(
              onTap: () => print('Sort Pressed'),
              child: Row(
                children: [
                  Text(
                    'Sort',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 5),
                    Image.asset(
                    AppIcons.sort,
                    width: 16.0,
                    height: 16.0,
                    color: Color(0xFF232327),
                    ),
                ],
              ),
            ),
            SizedBox(width: 15), // Space between Sort and Filter
            GestureDetector(
              onTap: () => print('Filter Pressed'),
              child: Row(
                children: [
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Montserrat',
                      color: AppColors.blackColor,
                    ),
                  ),
                  SizedBox(width: 5),
                    Image.asset(
                    AppIcons.filter,
                    width: 16.0,
                    height: 16.0,
                    color: Color(0xFF232327),
                    ),                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget _buildBottomNavigationBar() {
  return SafeArea(
    child: Container(
      height: 58.0,
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
    ),
  );
}}
