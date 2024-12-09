import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String timeLeft;
  final String deliveryAddress;

  StatusWidget({
    required this.timeLeft,
    required this.deliveryAddress,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: height * 0.02,
      ),
      child: Column(
        children: [
          Text(
            timeLeft,
            style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.w600,
              color: Color(0xFF242424),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.01),
          Text(
            deliveryAddress,
            style: TextStyle(
              fontSize: height * 0.02,
              fontWeight: FontWeight.w400,
              color: Color(0xFF818181),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFF35C680),
                  height: height * 0.01,
                ),
              ),
              SizedBox(width: width * 0.01),
              Expanded(
                child: Container(
                  color: Color(0xFF35C680),
                  height: height * 0.01,
                ),
              ),
              SizedBox(width: width * 0.01),
              Expanded(
                child: Container(
                  color: Color(0xFF35C680),
                  height: height * 0.01,
                ),
              ),
              SizedBox(width: width * 0.01),
              Expanded(
                child: Container(
                  color: Color(0xFFD1D1D1),
                  height: height * 0.01,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.all(height * 0.02),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE0E0E0)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: height * 0.06,
                  height: height * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/delivery_icon.png',
                      height: height * 0.04,
                      color: Color(0xFFC67C4E),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivered your order',
                        style: TextStyle(
                          fontSize: height * 0.02,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF242424),
                        ),
                      ),
                      Text(
                        'We will deliver your goods to you in the shortest possible time.',
                        style: TextStyle(
                          fontSize: height * 0.017,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFA2A2A2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
