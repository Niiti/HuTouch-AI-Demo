import 'package:flutter/material.dart';
import 'package:my_project/modules/home/presentation/widgets/rounded_image_card.dart';

class SectionScroll extends StatelessWidget {
  final String title;
  final List<String> imageAssets;
  const SectionScroll({
    super.key,
    required this.title,
    required this.imageAssets,
  });
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final fontSize = height * 0.0216;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.032,
        vertical: height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                fontFamily: 'Inter',
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  imageAssets
                      .map(
                        (asset) => GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.02),
                            child: RoundedImageCard(asset: asset),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
