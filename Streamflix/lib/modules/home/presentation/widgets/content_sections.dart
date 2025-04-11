import 'package:flutter/material.dart';
import 'package:my_project/modules/home/presentation/widgets/section_scroll.dart';
import 'package:my_project/core/constants/images_asset.dart';

class ContentSections extends StatelessWidget {
  const ContentSections({super.key});
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionScroll(
              title: 'Crime & Drama TV Shows',
              imageAssets: [
                ImagesAsset.movie1,
                ImagesAsset.movie2,
                ImagesAsset.movie3,
              ],
            ),
            SectionScroll(
              title: 'My List',
              imageAssets: [
                ImagesAsset.movie4,
                ImagesAsset.movie5,
                ImagesAsset.movie6,
              ],
            ),
            SectionScroll(
              title: 'Sci-Fi, Fantasy & Horror',
              imageAssets: [
                ImagesAsset.movie7,
                ImagesAsset.movie8,
                ImagesAsset.movie9,
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
