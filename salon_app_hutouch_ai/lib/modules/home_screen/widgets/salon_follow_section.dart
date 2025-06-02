 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class SalonFollowSection extends StatelessWidget {
  const SalonFollowSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.04;
    final avatarData = const [
      {'image': ImagesAsset.story1, 'label': ''},
      {'image': ImagesAsset.story2, 'label': ''},
      {'image': ImagesAsset.story3, 'label': ''},
      {'image': ImagesAsset.story4, 'label': ''},
      {'image': ImagesAsset.story5, 'label': ''},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.salonFollowTitle,
            style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.manrope,
              color: const Color.fromRGBO(17, 17, 17, 1),
            ),
          ),
          SizedBox(height: height * 0.02),
          AvatarCircleList(
            avatars: avatarData,
            avatarSize: height * 0.08,
            onTap: (i) {
              Navigator.pushNamed(context, '/salon-details');
            },
          ),
        ],
      ),
    );
  }
}

class AvatarCircleList extends StatelessWidget {
  final List<Map<String, String>> avatars;
  final double avatarSize;
  final ValueChanged<int>? onTap;
  final int? selectedIndex;

  const AvatarCircleList({
    Key? key,
    required this.avatars,
    required this.avatarSize,
    this.onTap,
    this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: avatarSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: avatars.length,
        separatorBuilder: (_, __) => SizedBox(width: avatarSize * 0.2),
        itemBuilder: (context, i) {
          final borderColor =
              selectedIndex != null && selectedIndex == i ? const Color.fromRGBO(21, 103, 120, 1) : Colors.white;
          final borderWidth = selectedIndex != null && selectedIndex == i ? 3.0 : 2.0;
          return GestureDetector(
            onTap: () => onTap?.call(i),
            child: Container(
              width: avatarSize,
              height: avatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: borderColor, width: borderWidth),
                image: DecorationImage(
                  image: AssetImage(avatars[i]['image'] ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: avatars[i]['label']?.isNotEmpty ?? false
                  ? Container(
                      margin: EdgeInsets.only(bottom: 3),
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        avatars[i]['label']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: avatarSize * 0.18,
                          fontFamily: Fonts.manrope,
                        ),
                      ),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
 
