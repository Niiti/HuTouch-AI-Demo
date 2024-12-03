import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_constants.dart';

class RecentVideoCard extends StatelessWidget {
  final int index;

  RecentVideoCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(right: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video Thumbnail with Duration
          Stack(
            children: [
              Image.asset(
                AppConstants.shortsThumbnailPath,
                width: width * 0.4,
                height: height * 0.22,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    '0:50',
                    style: TextStyle(
                        color: AppConstants.secondaryColor,
                        fontSize: width * 0.03),
                  ),
                ),
              ),
            ],
          ),
          // Video Title
          Padding(
            padding: EdgeInsets.only(top: AppConstants.paddingSmall),
            child: Text(
              'Heart Touching Nasheed #Shorts'.tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: width * 0.04),
            ),
          ),
          // Channel Name and More Options
          Row(
            children: [
              Text(
                'An Naffe'.tr,
                style: TextStyle(
                    color: AppConstants.greyColor, fontSize: width * 0.035),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                iconSize: width * 0.045,
                onPressed: () {
                  // Handle more options
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
