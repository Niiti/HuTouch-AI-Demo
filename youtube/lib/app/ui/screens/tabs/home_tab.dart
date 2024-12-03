import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_constants.dart';
import '../../widgets/search_icon_widget.dart';
import '../../widgets/video_card.dart';
import '../../widgets/story_card.dart';
import '../../widgets/filter_chip_widget.dart';
import 'search_page.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppConstants.primaryColor,
      appBar: AppBar(
        backgroundColor: AppConstants.appBarColor,
        elevation: AppConstants.appBarElevation,
        leadingWidth: width * 0.3,
        leading: Image.asset(
          'assets/logo/logo_full.png',
          fit: BoxFit.contain,
          height: height * 0.04,
        ),
        actions: [
          IconButton(
                icon: Image.asset('assets/logo/Property 1=2.png', color: AppConstants.iconColor),
              onPressed: () {}),
          IconButton(
                icon: Image.asset('assets/logo/Property 1=55.png', color: AppConstants.iconColor),
              onPressed: () {}),
              SearchIconWidget(onTap: () {
            // Navigate to Search Page
            Get.to(() => SearchPage());
          }),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                radius: AppConstants.avatarRadius,
                backgroundImage: AssetImage('assets/images/Rectangle 9.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                child: Row(
                  children: [
                    FilterChipWidget(
                        key: Key('explore'), label: 'Explore', isActive: true),
                    SizedBox(width: width * 0.03),
                    FilterChipWidget(key: Key('all'), label: 'All'),
                    SizedBox(width: width * 0.03),
                    FilterChipWidget(key: Key('mixes'), label: 'Mixes'),
                    SizedBox(width: width * 0.03),
                    FilterChipWidget(key: Key('music'), label: 'Music'),
                    SizedBox(width: width * 0.03),
                    FilterChipWidget(key: Key('graphic'), label: 'Graphic'),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.grey[300]),
            VideoCard(
              key: Key('videoCard1'),
              thumbnail: 'assets/images/Rectangle 7.png',
              avatar: 'assets/images/Rectangle 9.png',
              title: 'The Beauty of Existence - Heart Touching Nasheed',
              views: '19,210,251 views  •  Jul 1, 2016',
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, height * 0.02, width * 0.05, height * 0.02),
              child: Row(
                children: [
                    Image.asset(
                      'assets/logo/Property 1=ON-4.png',
                      height: height * 0.055,
                      color: Colors.red,
                    ),
                    SizedBox(width: width * 0.01),
                  Text(
                    "Storts",
                    style: TextStyle(
                      fontSize: height * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: width * 0.02),
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.005),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "BETA",
                      style: TextStyle(
                        fontSize: height * 0.015,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.35,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(width * 0.05),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return StoryCard(
                    image: 'assets/images/Rectangle 9-2.png',
                    title:
                        'DIY Toys | Satisfying And Relaxing | DIY Tiktok Compilation..',
                    views: '24M views',
                    key: Key('storyCard$index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
