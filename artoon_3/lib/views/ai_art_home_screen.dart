import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/ai_art_home_viewmodel.dart';
import '../widgets/trending_avatar.dart';
import '../widgets/play_win_banner.dart';
import '../widgets/art_category_tab.dart';
import '../resources/strings.dart';
// import '../resources/colors.dart';

class AiArtHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AiArtHomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text(Strings.aiArt)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingAvatar(avatar: viewModel.trendingAvatars[0]),
            SizedBox(height: 16),
            PlayWinBanner(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: Strings.categories.map((category) {
                return ArtCategoryTab(
                  category: category,
                  isSelected: viewModel.selectedCategory == category,
                  onTap: () => viewModel.onCategorySelected(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Flexible(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: viewModel.artItems.length,
                itemBuilder: (context, index) {
                  final artItem = viewModel.artItems[index];
                  return GestureDetector(
                    onTap: () => viewModel.onArtItemSelected(artItem),
                    child: TrendingAvatar(avatar: artItem),
                  );
                },
              ),
            ),
          ],
        ),
      ),
bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: viewModel.currentIndex,
  onTap: viewModel.onBottomNavItemSelected,
  selectedItemColor: Colors.blue,
  unselectedItemColor: Colors.grey,
  items: [
    BottomNavigationBarItem(
      icon: Icon(Icons.art_track),
      label: Strings.aiArt,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.enhance_photo_translate),
      label: Strings.aiEnhance,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo),
      label: Strings.artoonAi,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.image),
      label: Strings.aiImage,
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: Strings.profile,
    ),
  ],
),
    );
  }
}
