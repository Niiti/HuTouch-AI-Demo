import 'package:flutter/material.dart';
import 'package:my_project/features/tour/presentation/widgets/thumbnail_widget.dart';

class ThumbnailList extends StatelessWidget {
  const ThumbnailList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        padding: EdgeInsets.all(screenHeight * 0.01),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(19, 19, 22, 1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                ThumbnailWidget(
                  imagePath: 'assets/images/small_thums_icon_1.png',
                  isSelected: true,
                ),
                ThumbnailWidget(imagePath: 'assets/images/small_thums_icon_2.png'),
                ThumbnailWidget(imagePath: 'assets/images/small_thums_icon_3.png'),
                ThumbnailWidget(imagePath: 'assets/images/small_thums_icon_4.png'),
                ThumbnailWidget(imagePath: 'assets/images/small_thums_icon_5.png'),
                ThumbnailWidget(imagePath: 'assets/images/small_thums_icon_6.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}