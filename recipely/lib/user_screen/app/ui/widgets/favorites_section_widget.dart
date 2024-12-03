import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import 'favorite_card_widget.dart';
import '../../../core/utils/responsive_helper.dart';

class FavoritesSectionWidget extends StatelessWidget {
  final Size size;
  late final DashboardController controller;

  FavoritesSectionWidget({Key? key, required this.size}) : super(key: key) {
    controller = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'My Favorites',
                style: TextStyle(
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Handle see all action
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: size.height * 0.018,
                    color: Colors.teal,
                  ),
                ),
              ),
            ],
          ),
          Obx(() {
            if (controller.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (controller.favorites.isEmpty) {
              return Center(child: Text('No favorites found.'));
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveHelper.getCrossAxisCount(size),
                  crossAxisSpacing: size.width * 0.04,
                  mainAxisSpacing: size.height * 0.02,
                  childAspectRatio: 0.75,
                ),
                itemCount: controller.favorites.length,
                itemBuilder: (context, index) {
                  var favorite = controller.favorites[index];
                  return FavoriteCardWidget(
                    size: size,
                    imageUrl: favorite.imageUrl,
                    title: favorite.title,
                    author: favorite.author,
                  );
                },
              );
            }
          }),
        ],
      ),
    );
  }
}
