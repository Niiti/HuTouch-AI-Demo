import 'package:flutter/material.dart';
import '../../core/constants/config.dart';
import '../../core/utils/responsive.dart';
import '../../model/recipe_model.dart';

class FeaturedCard extends StatelessWidget {
  final RecipeModel recipe;

  const FeaturedCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(context, 0.65),
      margin: EdgeInsets.only(right: responsiveWidth(context, 0.04)),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(responsiveWidth(context, 0.03)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(responsiveWidth(context, 0.03)),
            child: Image.network(
              recipe.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(responsiveWidth(context, 0.03)),
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            bottom: responsiveWidth(context, 0.03),
            left: responsiveWidth(context, 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: responsiveWidth(context, 0.58),
                  child: Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 0.045),
                      fontFamily: 'Sofia Pro',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: responsiveWidth(context, 0.01)),
                Row(
                  children: [
                    CircleAvatar(
                      radius: responsiveWidth(context, 0.025),
                      backgroundImage: NetworkImage(recipe.imageUrl),
                    ),
                    SizedBox(width: responsiveWidth(context, 0.01)),
                    Text(
                      recipe.author,
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 0.032),
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                    SizedBox(width: responsiveWidth(context, 0.01)),
                    Icon(Icons.timelapse,
                        color: Colors.white.withOpacity(0.75),
                        size: responsiveWidth(context, 0.03)),
                    SizedBox(width: responsiveWidth(context, 0.01)),
                    Text(
                      recipe.time,
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 0.032),
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
