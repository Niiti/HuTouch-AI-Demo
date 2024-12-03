import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class VideoCardWidget extends StatelessWidget {
  final String thumbnail;
  final String avatar;
  final String title;
  final String views;
  final String date;
  final double width;

  const VideoCardWidget({
    Key? key,
    required this.thumbnail,
    required this.avatar,
    required this.title,
    required this.views,
    required this.date,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                thumbnail,
                width: double.infinity,
                height: width * 0.6,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: width * 0.02,
                bottom: width * 0.02,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  color: Colors.white,
                  child: Text(
                    AppConstants.shortsLabel,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: width * 0.035,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.02),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                  radius: width * 0.05,
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.play_circle_fill_sharp,
                            size: width * 0.04,
                            color: Colors.black,
                          ),
                          SizedBox(width: width * 0.02),
                          Flexible(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(fontSize: width * 0.035),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * 0.01),
                      Text(
                        '$views • $date',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  iconSize: width * 0.06,
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
