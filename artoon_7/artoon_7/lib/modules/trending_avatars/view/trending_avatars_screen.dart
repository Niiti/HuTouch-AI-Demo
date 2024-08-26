
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/avatar_view_model.dart';
import 'widgets/trending_section.dart';
import 'widgets/promotion_banner.dart';
import 'widgets/categories_tabs.dart';
import 'widgets/avatar_preview.dart';
import '../../../common/navigation_bar.dart';

class TrendingAvatarsScreen extends StatelessWidget {
  final avatarViewModel = Get.put(AvatarViewModel());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Trending Avatars'),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(13, 13, 13, 1),
            fontSize: MediaQuery.of(context).size.width * 0.05,   
            fontWeight: FontWeight.bold,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TrendingSection(),
              PromotionBanner(),
              CategoriesTabs(),
              AvatarPreviewsSection(),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}