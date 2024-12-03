import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../core/constants/design_constants.dart';

class FavoriteCardWidget extends StatelessWidget {
  final Size size;
  final String imageUrl;
  final String title;
  final String author;
  final DashboardController controller;

  FavoriteCardWidget({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.title,
    required this.author,
  }) : controller = Get.find(), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  imageUrl,
                  width: double.infinity,
                  height: size.height * 0.15,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: size.height * 0.01,
                right: size.height * 0.01,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.favorite, color: Colors.teal),
                    onPressed: () {
                      controller.toggleFavorite(title);
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: Text(
              title,
              style: TextStyle(
                fontSize: size.height * 0.018,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Row(
              children: [
                CircleAvatar(
                  radius: size.width * 0.03,
                  backgroundImage: AssetImage('assets/user2.png'),
                ),
                SizedBox(width: size.width * 0.02),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: size.height * 0.016,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
