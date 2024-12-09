import 'package:flutter/material.dart';

void main() {
  runApp(ReviewPage());
}

class ReviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIC App',
      home: BICPage(),
    );
  }
}

class BICPage extends StatefulWidget {
  @override
  _BICPageState createState() => _BICPageState();
}

class _BICPageState extends State<BICPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                color: Colors.white, // Changed banner color to white
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.02,
                ),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      'BIC',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: screenWidth * 0.04),
                        Icon(Icons.shopping_bag_outlined, color: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
              // Image Banner with Overlapping Card
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/banner2.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -screenHeight * 0.08,
                    left: screenWidth * 0.1,
                    right: screenWidth * 0.1,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.04),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.07,
                            ),
                            SizedBox(width: screenWidth * 0.05),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Bahrain International Circuit',
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  Row(
                                    children: List.generate(5, (index) {
                                      return Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                        size: screenWidth * 0.06,
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.1),
              // Tabs Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.005),
                            width: screenWidth * 0.3,
                            height: 2,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: screenHeight * 0.005),
                            width: screenWidth * 0.15,
                            height: 2,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Description Section
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Text(
                  'Located in the heart of the Sakhir desert, Bahrain International Circuit is a unique and contemporary facility that is synonymous with the highest levels of global motorsport. Featuring five different track layouts, the circuit first saw life in 2004 when the first ever Formula 1 Grand Prix took place in the country, making it the first-ever track in the Middle East to host the Formula 1 World Championship.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    height: 1.5,
                    fontFamily: 'Poppins',
                    color: Colors.black,
                  ),
                ),
              ),
              // Review Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Review',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Add a Review',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // No Data Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/nodata.png',
                      width: screenWidth * 0.5,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'No data available',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
