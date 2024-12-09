import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(Cancelorder());
}

class Cancelorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Management App',
      home: MainPage(),
      routes: {
        '/seller': (context) => SellerDetailPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                height: height * 0.08, // Adjust height as needed
                color: Color(0xFFB80000),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: ['PENDING', 'COMPLETED', 'CANCELLED'].map((tab) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          tab,
                          style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        if (tab ==
                            'PENDING') // Only apply underline for "PENDING"
                          Positioned(
                            bottom: height * 0.005, // Position of underline
                            child: Container(
                              width: tab.length *
                                  height *
                                  0.012, // Adjust width dynamically
                              height: 2, // Thickness of the underline
                              color: Colors.white,
                            ),
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),

              // Order Details
              Padding(
                padding: EdgeInsets.all(width * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order : BH-100-100222',
                          style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'BHD100',
                          style: TextStyle(
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Seller : ',
                            style: TextStyle(
                              fontSize: height * 0.016,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Ashrafs Bahrain',
                            style: TextStyle(
                              fontSize: height * 0.016,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFB80000),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.pushNamed(context, '/seller'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.007),
                    Text(
                      'Placed on Dec 20,2021',
                      style: TextStyle(
                        fontSize: height * 0.015,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Group.png',
                          height: height * 0.1,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: width * 0.05),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Bose SoundLink   \nMicro Bluetooth Speaker',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: height * 0.018,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: height * 0.02),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFB80000),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: height * 0.01,
                                    horizontal: width * 0.05,
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                    fontSize: height * 0.018,
                                    color: Colors
                                        .white, // Set the font color to white
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    // Progress Bar
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 5,
                            color: Color(0xFF1FE9D0),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 5,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 5,
                            color: Color(0xFFCCCCCC),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.005),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order Placed',
                              style: TextStyle(fontSize: height * 0.013)),
                          Text('Processing',
                              style: TextStyle(fontSize: height * 0.013)),
                          Text('Out for delivery',
                              style: TextStyle(fontSize: height * 0.013)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFB80000),
          unselectedItemColor: Colors.black,
          currentIndex: 2,
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
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

class SellerDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String sellerName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('$sellerName Details'),
        backgroundColor: Color(0xFFB80000),
      ),
      body: Center(
        child: Text(
          'Details for $sellerName',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
