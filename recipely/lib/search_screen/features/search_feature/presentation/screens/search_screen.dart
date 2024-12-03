import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipely/home_screen/core/constants/config.dart';
import 'package:recipely/home_screen/core/utils/responsive.dart';
import 'package:recipely/home_screen/presentation/widgets/bottom_nav_bar.dart';
import '../../../../../home_screen/state/main_controller.dart';
import '../widgets/header_section.dart';
import '../widgets/search_bar.dart' as sb;
import '../widgets/category_tabs.dart';
import '../widgets/popular_recipes.dart';
import '../widgets/editors_choice.dart';
import '../../controllers/search_controller.dart' as sc;


class SearchScreen extends StatelessWidget {
  final MainController controller = Get.put(MainController());
  final sc.SearchController searchController = Get.find<sc.SearchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderSection(),
              sb.SearchBar(),
              Obx(() {
                 if (searchController.isLoading.value) {
                   return Center(child: CircularProgressIndicator());
                 }
                 if (searchController.searchResults.isEmpty) {
                   return Center(child: Text('No results found'));
                 }
                 return Expanded(
                   child: ListView.builder(
                     itemCount: searchController.searchResults.length,
                     itemBuilder: (context, index) {
                       final recipe = searchController.searchResults[index];
                       return ListTile(
                         leading: Image.network(recipe['imageUrl'] ?? ''),
                         title: Text(recipe['title'] ?? 'No Title'),
                       );
                     },
                   ),
                 );
               }),
              CategoryTabs(),
              PopularRecipes(),
              EditorsChoice(),
            ],
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
}
