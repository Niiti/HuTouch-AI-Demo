 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';

class InterestSection extends StatefulWidget {
  const InterestSection({Key? key}) : super(key: key);

  @override
  State<InterestSection> createState() => _InterestSectionState();
}

class _InterestSectionState extends State<InterestSection> {
  int selectedIndex = 0;

  static const interests = [
    AppStrings.categoryHaircut,
    AppStrings.categoryFacial,
    AppStrings.categoryNails,
  ];

  static const categories = [
    {
      'label': AppStrings.categoryHaircut,
      'asset': ImagesAsset.haircutIcon,
    },
    {
      'label': AppStrings.categoryNails,
      'asset': ImagesAsset.nailsIcon,
    },
    {
      'label': AppStrings.categoryFacial,
      'asset': ImagesAsset.facialIcon,
    },
    {
      'label': AppStrings.categoryColoring,
      'asset': ImagesAsset.coloringIcon,
    },
    {
      'label': AppStrings.categorySpa,
      'asset': ImagesAsset.spaIcon,
    },
    {
      'label': AppStrings.categoryWaxing,
      'asset': ImagesAsset.waxingIcon,
    },
    {
      'label': AppStrings.categoryMakeup,
      'asset': ImagesAsset.makeupIcon,
    },
    {
      'label': AppStrings.categoryMassage,
      'asset': ImagesAsset.massageIcon,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final padding = width * 0.04;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.mostSearchInterestTitle,
            style: TextStyle(
              fontSize: height * 0.025,
              fontWeight: FontWeight.bold,
              fontFamily: Fonts.manrope,
              color: const Color.fromRGBO(17, 17, 17, 1),
            ),
          ),
          SizedBox(height: height * 0.02),
          TabPillSelector(
            options: interests,
            assetPaths: categories.map((e) => e['asset']!).toList(),
            selectedIndex: selectedIndex,
            onSelect: (i) => setState(() {
              selectedIndex = i;
            }),
            hasIcons: false,
          ),
        ],
      ),
    );
  }
}

class TabPillSelector extends StatelessWidget {
  final List<String> options;
  final List<String?> assetPaths;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool hasIcons;

  const TabPillSelector({
    Key? key,
    required this.options,
    required this.assetPaths,
    required this.selectedIndex,
    required this.onSelect,
    this.hasIcons = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pillIconSize = width * 0.07;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(options.length, (i) {
          final selected = selectedIndex == i;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              height: 50,
              margin: EdgeInsets.only(right: width * 0.035),
              padding: EdgeInsets.symmetric(horizontal: width * 0.045, vertical: width * 0.025),
              decoration: BoxDecoration(
                color: selected ? const Color.fromRGBO(21, 103, 120, 1) : const Color.fromRGBO(224, 245, 249, 1),
                borderRadius: BorderRadius.circular(48),
              ),
              child: Row(
                children: [
                  Image.asset(
                    assetPaths[i]!,
                    width: pillIconSize,
                    color: selected ? Colors.white : const Color.fromRGBO(21, 103, 120, 1),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    options[i],
                    style: TextStyle(
                      fontSize: width * 0.037,
                      fontFamily: Fonts.manrope,
                      fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                      color: selected ? Colors.white : const Color.fromRGBO(21, 103, 120, 1),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
 
