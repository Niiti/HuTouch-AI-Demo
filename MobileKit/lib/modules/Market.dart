import 'package:flutter/material.dart';
import '../../Profile.dart';

class MarketUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: screenHeight * 0.02),

                // Header Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Back',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5DB075),
                        ),
                      ),
                    ),
                    Text(
                      'Market',
                      style: TextStyle(
                        fontSize: screenHeight * 0.03,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(styles: {
                              'Green/Primary': Color(0xFF34C759),
                              'White': Color(0xFFFFFFFF),
                              'Gray/01': Color(0xFFF6F6F6),
                              'Gray/02': Color(0xFFE8E8E8),
                              'Gray/03': Color(0xFFBDBDBD),
                              'Black': Color(0xFF000000),
                            }),
                          ),
                        );
                      },
                      child: Text(
                        'Filter',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5DB075),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: screenHeight * 0.02),

                // Search Section
                Container(
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(screenHeight * 0.03),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFBDBDBD),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),

                // Hot Deals Section
                Section(
                  title: 'Hot deals',
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),

                SizedBox(height: screenHeight * 0.03),

                // Trending Section
                Section(
                  title: 'Trending',
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),

                SizedBox(height: screenHeight * 0.03),

                // Deals Section
                Padding(
                  padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                  child: Text(
                    'Deals',
                    style: TextStyle(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),

                // Bottom Navigation
                Container(
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(screenHeight * 0.02),
                    ),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: 0,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.circle,
                            color: Color(0xFF5DB075),
                            size: screenHeight * 0.05),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.circle,
                            color: Color(0xFFE0E0E0),
                            size: screenHeight * 0.05),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.circle,
                            color: Color(0xFFE0E0E0),
                            size: screenHeight * 0.05),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.circle,
                            color: Color(0xFFE0E0E0),
                            size: screenHeight * 0.05),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.circle,
                            color: Color(0xFFE0E0E0),
                            size: screenHeight * 0.05),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ],
            ), // Close Column
          ), // Close Padding
        ), // Close SingleChildScrollView
      ), // Close SafeArea
    ); // Close Scaffold
  } // Close build method
} // Close MarketUI class

class Section extends StatelessWidget {
  const Section({
    Key? key,
    required this.title,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final String title;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: screenHeight * 0.02),
        GridView.builder(
          shrinkWrap: true, // Allow the GridView to size itself
          physics: NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            childAspectRatio: 0.75,
            mainAxisSpacing: screenHeight * 0.02,
            crossAxisSpacing: screenWidth * 0.02,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(screenHeight * 0.01),
                    image: DecorationImage(
                      image: AssetImage('assets/Content Block.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Item #${index + 2} Name\nGoes Here',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '\$19.99',
                  style: TextStyle(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
