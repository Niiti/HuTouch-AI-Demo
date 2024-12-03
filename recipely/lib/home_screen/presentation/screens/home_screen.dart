import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/config.dart';
import '../../core/utils/responsive.dart';
import '../widgets/featured_card.dart';
import '../widgets/popular_recipe_card.dart';
import '../widgets/category_chip.dart';
import '../widgets/header_section.dart';
import '../widgets/bottom_nav_bar.dart';
import '../../state/main_controller.dart';

class HomeScreen extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(responsiveWidth(context, 0.04)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              HeaderSection(),
              SizedBox(height: responsiveHeight(context, 0.02)),
              _buildFeaturedSection(context),
              SizedBox(height: responsiveHeight(context, 0.03)),
              _buildCategorySection(context),
              SizedBox(height: responsiveHeight(context, 0.03)),
              _buildPopularRecipesSection(context),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(3, 38, 40, 1),
        onPressed: () {},
        child: Image.asset(Assets.chefIcon,
            width: responsiveWidth(context, 0.075)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFeaturedSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Featured', onSeeAllTap: () {}),
        SizedBox(height: responsiveHeight(context, 0.01)),
        SizedBox(
          height: responsiveHeight(context, 0.27),
          child: Obx(() {
            if (mainController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else if (mainController.featuredRecipes.isEmpty) {
              return Center(child: Text('No recipes available'));
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mainController.featuredRecipes.length,
                itemBuilder: (context, index) {
                  final recipe = mainController.featuredRecipes[index];
                  return FeaturedCard(recipe: recipe);
                },
              );
            }
          }),
        ),
      ],
    );
  }

  Widget _buildCategorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Category', onSeeAllTap: () {}),
        SizedBox(height: responsiveWidth(context, 0.01)),
        Wrap(
          spacing: 8.0,
          children: mainController.categories
              .map((category) => CategoryChip(
                    key: ValueKey(category),
                    label: category,
                    isSelected:
                        category == mainController.selectedCategory.value,
                    onTap: () =>
                        mainController.toggleSelectedCategory(category),
                  ))
              .toList(),
        ),
      ],
    );
  }

  // Widget _buildCategorySection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildSectionHeader(context, 'Category', onSeeAllTap: () {}),
  //       SizedBox(height: responsiveWidth(context, 0.01)),
  //       Wrap(
  //         spacing: responsiveWidth(context, 0.03),
  //         children: ['Breakfast', 'Lunch', 'Dinner']
  //             .map((category) => CategoryChip(
  //                   key: ValueKey(category),
  //                   label: category,
  //                   isSelected: category == mainController.selectedCategory.value,
  //                   onTap: () {
  //                     mainController.selectedCategory.value = category;
  //                   },
  //                 ))
  //             .toList(),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildPopularRecipesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Popular Recipes', onSeeAllTap: () {}),
        SizedBox(height: responsiveHeight(context, 0.01)),
        SizedBox(
          height: responsiveHeight(context, 0.5),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: responsiveWidth(context, 0.03),
              mainAxisSpacing: responsiveHeight(context, 0.02),
              childAspectRatio: 3 / 4,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return PopularRecipeCard(key: ValueKey(index), index: index, recipeId: 1,);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title,
      {required VoidCallback onSeeAllTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyleConstants.headerStyle,
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Text(
            'See All',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontFamily: 'Sofia Pro',
              fontSize: responsiveWidth(context, 0.04),
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
