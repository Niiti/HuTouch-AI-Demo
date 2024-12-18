import 'package:flutter/material.dart';
// Import CalendarUI if it's in a separate file
// import 'path_to_calendar_ui.dart';
import 'calendar_ui.dart';

class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* <<------------ Header Section ------------>> */
              Container(
                color: Color(0xFF5CA37E),
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        // Navigate to CalendarUI when back button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CalendarUI(),
                          ),
                        );
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Market',
                          style: TextStyle(
                            fontSize: height * 0.035,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.12),
                  ],
                ),
              ),
              /* <<------------ Video Section ------------>> */
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.03),
                  width: width * 0.9,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: width * 0.075,
                          backgroundColor:
                              Color.fromRGBO(75, 147, 96, 0.1),
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Color.fromRGBO(93, 176, 116, 1),
                              size: width * 0.08,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /* <<------------ Hot Deals Section ------------>> */
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  'Hot deals',
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Container(
                height: height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: width * 0.04),
                      width: width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.12,
                            decoration: BoxDecoration(
                              color:
                                  Color.fromRGBO(246, 246, 246, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/Content Block.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            'Item #${index + 1} Name\nGoes Here',
                            style: TextStyle(
                              fontSize: height * 0.017,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            '\$19.99',
                            style: TextStyle(
                              fontSize: height * 0.017,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              /* <<------------ Trending Section ------------>> */
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                  horizontal: width * 0.04,
                ),
                child: Text(
                  'Trending',
                  style: TextStyle(
                    fontSize: height * 0.03,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: width * 0.04),
                      width: width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: height * 0.12,
                            decoration: BoxDecoration(
                              color:
                                  Color.fromRGBO(246, 246, 246, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/Content Block.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            'Item #${index + 1} Name\nGoes Here',
                            style: TextStyle(
                              fontSize: height * 0.017,
                              fontFamily: 'Inter',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Text(
                            '\$19.99',
                            style: TextStyle(
                              fontSize: height * 0.017,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: Color.fromRGBO(92, 163, 126, 1)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,
                color: Color.fromRGBO(232, 232, 232, 1)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,
                color: Color.fromRGBO(232, 232, 232, 1)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: Color.fromRGBO(232, 232, 232, 1)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,
                color: Color.fromRGBO(232, 232, 232, 1)),
            label: '',
          ),
        ],
      ),
    );
  }
}
