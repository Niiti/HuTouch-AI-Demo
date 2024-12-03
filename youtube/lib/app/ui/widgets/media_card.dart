import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class MediaCard extends StatelessWidget {
  final double screenWidth;

  const MediaCard({
    Key? key,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: screenWidth * 0.55,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppConstants.videoPlaceholder),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: screenWidth * 0.02,
                right: screenWidth * 0.02,
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Text(
                    '10:14',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Compilation | Everything Belongs to Allah 33 Mins | Omar...',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: screenWidth * 0.01),
                      Text(
                        'Omar & Hana - Islamic',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.005),
                      Text(
                        '5.5M views',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
