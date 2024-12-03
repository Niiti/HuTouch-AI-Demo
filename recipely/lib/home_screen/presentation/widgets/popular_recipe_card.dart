import 'package:flutter/material.dart';
import '../../core/constants/config.dart';
import '../../core/utils/responsive.dart';
import '../../state/main_controller.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PopularRecipeCard extends StatelessWidget {
  final int index;
  final int recipeId; // Unique recipeID for each card
  final MainController mainController = Get.find();
  final String apiUrl = 'https://4c2210a8-b849-4b78-8998-a6d861d8825a.mock.pstmn.io/api/favorites';

  PopularRecipeCard({required Key key, required this.index, required this.recipeId}) : super(key: key);
  Future<void> _addToFavorites(int userId, int recipeId) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'recipeId': recipeId,
        }),
      );

      if (response.statusCode == 200) {
        Get.snackbar('Success', 'Added to favourites.');
        mainController.updateFavoriteStatus(index, true);
      } else {
        Get.snackbar('Error', 'Failed to add to favourites.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Network issue, please try again.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(responsiveWidth(context, 0.03)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(responsiveWidth(context, 0.03))),
            child: Stack(
              children: [
                Image.asset(
                  'assets/healthy_tako.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: responsiveWidth(context, 0.3),
                ),
                Positioned(
                  top: responsiveWidth(context, 0.02),
                  right: responsiveWidth(context, 0.02),
                  child: GestureDetector(
                    onTap: () {
                      mainController.toggleFavorite(index);
                    },
                    child: Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding:
                              EdgeInsets.all(responsiveWidth(context, 0.01)),
                          child: Icon(
                            mainController.favoriteIndices.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color:
                                mainController.favoriteIndices.contains(index)
                                    ? Colors.red
                                    : Colors.grey,
                            size: responsiveWidth(context, 0.045),
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(responsiveWidth(context, 0.03)),
            child: Text(
              'Healthy Taco Salad with fresh vegetable',
              style: TextStyle(
                fontSize: responsiveWidth(context, 0.045),
                fontFamily: 'Sofia Pro',
                fontWeight: FontWeight.w700,
                color: AppColors.secondary,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 0.03)),
            child: Row(
              children: [
                Icon(Icons.local_fire_department_outlined,
                    color: AppColors.secondary.withOpacity(0.6),
                    size: responsiveWidth(context, 0.04)),
                SizedBox(width: responsiveWidth(context, 0.01)),
                Text(
                  '120 Kcal',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 0.035),
                    fontFamily: 'Sofia Pro',
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary.withOpacity(0.6),
                  ),
                ),
                SizedBox(width: responsiveWidth(context, 0.03)),
                Icon(Icons.timelapse,
                    color: AppColors.secondary.withOpacity(0.6),
                    size: responsiveWidth(context, 0.04)),
                SizedBox(width: responsiveWidth(context, 0.01)),
                Text(
                  '20 Min',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 0.035),
                    fontFamily: 'Sofia Pro',
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondary.withOpacity(0.6),
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
