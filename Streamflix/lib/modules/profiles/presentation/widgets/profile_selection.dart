import 'package:flutter/material.dart';
import 'package:my_project/core/constants/images_asset.dart';
import 'package:my_project/modules/splash/presentation/widgets/profile_selection_card.dart';

class ProfileSelection extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ProfileSelection({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    final cardWidth =
        screenWidth * 0.2; // Adjust card width based on screen size
    final cardSpacing = screenWidth * 0.05; // Adjust spacing dynamically

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: 16), // Add spacing at the start
          ProfileSelectionCard(
            imageAsset: ImagesAsset.profile1,
            userName: 'John',
          ),
          SizedBox(width: 16), // Spacing between cards
          ProfileSelectionCard(
            imageAsset: ImagesAsset.profile2,
            userName: 'Mike',
          ),
          SizedBox(width: 16),
          ProfileSelectionCard(
            imageAsset: ImagesAsset.profile3,
            userName: 'Helina',
          ),
          SizedBox(width: 16),
          ProfileSelectionCard(
            imageAsset: ImagesAsset.profile4,
            userName: 'Kids',
          ),
          SizedBox(width: 16), // Add spacing at the end
        ],
      ),
    );
  }
}
