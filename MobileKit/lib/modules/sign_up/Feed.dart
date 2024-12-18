import 'package:flutter/material.dart';
import '../Market.dart';
class GeneratedUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final padding = screenWidth * 0.03;
    final fontSizeMultiplier = screenWidth / 375;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MarketUI()),
    );
  },
  child: Text(
    'Filter',
    style: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16 * fontSizeMultiplier,
      fontWeight: FontWeight.w500,
      color: Color(0xFF5DB575),
    ),
  ),
),
                  Text(
                    'Feed',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 30 * fontSizeMultiplier,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16 * fontSizeMultiplier,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5DB575),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: padding, vertical: padding),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16 * fontSizeMultiplier,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFBDBDBD),
                  ),
                  filled: true,
                  fillColor: Color(0xFFF6F6F6),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: padding / 2, horizontal: padding),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: screenWidth * 0.13,
                              height: screenWidth * 0.13,
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Image.asset(
                                'assets/Content Block.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: padding),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Header',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16 * fontSizeMultiplier,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '8m ago',
                                        style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 14 * fontSizeMultiplier,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFFBDBDBD),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: padding / 3),
                                  Text(
                                    "He'll want to use your yacht, and I don't want this thing smelling like fish.",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14 * fontSizeMultiplier,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Divider(color: Color(0xFFE8E8E8)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(5, (index) {
                    return Container(
                      width: index == 0 ? 12.0 : 10.0,
                      height: index == 0 ? 12.0 : 10.0,
                      decoration: BoxDecoration(
                        color:
                            index == 0 ? Color(0xFF5DB575) : Color(0xFFE8E8E8),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
