import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/responsive_util.dart';

class RelatedRecipesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Related Recipes',
              style: TextStyle(
                fontFamily: 'Sofia Pro',
                fontWeight: FontWeight.w800,
                fontSize: width * 0.045,
                color: Color.fromRGBO(10, 37, 51, 1),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.snackbar(
                  'See All',
                  'See All Clicked',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text(
                'See All',
                style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  fontWeight: FontWeight.w800,
                  fontSize: width * 0.04,
                  color: Color.fromRGBO(111, 185, 190, 1),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: width * 0.35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _recipeCard('Egg & Avocado', width),
              _recipeCard('Bowl of Rice', width),
              _recipeCard('Chicken Salad', width),
            ],
          ),
        ),
      ],
    );
  }

  Widget _recipeCard(String name, double width) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.04),
      child: Column(
        children: [
          Container(
            width: width * 0.25,
            height: width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/japanese_food.png'),
              ),
            ),
          ),
          SizedBox(height: width * 0.02),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Sofia Pro',
              fontSize: width * 0.035,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
