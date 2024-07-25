import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isPremium;
  final VoidCallback onTap;

  const TrendingCard({
    required this.imageUrl,
    required this.title,
    required this.isPremium,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Image.asset(imageUrl, fit: BoxFit.cover),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
              // color: Colors.black45,
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                title,
                style: TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              ),
            ),
            if (isPremium)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  color: AppColors.premiumBadge,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text(
                    AppStrings.tryNow,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
class Avatar extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const Avatar({
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Dismissible(
        key: Key(imageUrl),
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          // Handle dismiss action here
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
