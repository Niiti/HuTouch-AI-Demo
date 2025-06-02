 
import 'package:flutter/material.dart';
import 'package:salon_app_hutouch_ai/core/constants/app_constants.dart';
import 'package:salon_app_hutouch_ai/modules/home_screen/widgets/category_item.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({Key? key}) : super(key: key);

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedIndex = 0;

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


   /* SELECTED CODE START */
return Padding(
  padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding * 0.5),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppStrings.whatDoYouWant,
        style: TextStyle(
          fontSize: height * 0.025,
          fontWeight: FontWeight.bold,
          fontFamily: Fonts.manrope,
          color: const Color.fromRGBO(17, 17, 17, 1),
        ),
      ),
      SizedBox(height: height * 0.02),
      Wrap( // Changed from TabPillSelector to Wrap to allow multiple rows
        spacing: 0.0,
        runSpacing: 0.0,
        children: List.generate(categories.length, (index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width - 5 * 8.0) / 4, // Updated to make space for 4 items per row
            child: TabPillSelector(
              options: [categories[index]['label']!],
              assetPaths: [categories[index]['asset']!],
              selectedIndex: selectedIndex,
              onSelect: (i) => setState(() {
                selectedIndex = index; // Updated to differentiate select index
              }),
              textBelowIcon: true,
            ),
          );
        }),
      ),
    ],
  ),
);
/* SELECTED CODE END */

  }
}

/* SELECTED CODE START */
/* SELECTED CODE START */
class TabPillSelector extends StatelessWidget {
  final List<String> options;
  final List<String> assetPaths;
  final int selectedIndex;
  final ValueChanged<int> onSelect;
  final bool textBelowIcon; // Added parameter for scenario control

  const TabPillSelector({
    Key? key,
    required this.options,
    required this.assetPaths,
    required this.selectedIndex,
    required this.onSelect,
    this.textBelowIcon = false, // Default set to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final pillHeight = width * 0.18;
    final pillIconSize = width * 0.07;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(options.length, (i) {
          final selected = selectedIndex == i;
          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              margin: EdgeInsets.only(right: width * 0.035),
              padding: EdgeInsets.symmetric(horizontal: width * 0.025, vertical: width * 0.015),
              child: Column( // Changed Row to Column for vertical alignment option
                mainAxisSize: MainAxisSize.min, // Adjust size for Column
                children: [
                  Container( // Added Container for circular background on icon
                    padding: EdgeInsets.all(width * 0.04), // Padding for circular effect
                    decoration: BoxDecoration(
                      color: selected ? const Color.fromRGBO(21, 103, 120, 1) : const Color.fromRGBO(224, 245, 249, 1),
                      shape: BoxShape.circle, // Circular background
                    ),
                    child: Image.asset(
                      assetPaths[i],
                      width: pillIconSize,
                      color: selected ? Colors.white : const Color.fromRGBO(21, 103, 120, 1),
                    ),
                  ),
                  if (textBelowIcon) // Conditional for scenario 1
                    SizedBox(height: width * 0.008),
                  if (textBelowIcon) // Conditional for scenario 1
                    Text(
                      options[i],
                      style: TextStyle(
                        fontSize: width * 0.037,
                        fontFamily: Fonts.manrope,
                        fontWeight: selected ? FontWeight.w700 : FontWeight.w600,
                        color: selected ? const Color.fromRGBO(21, 103, 120, 1) : const Color.fromRGBO(21, 103, 120, 1), // Color adjusted for background scenario
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


//  SecondaryButtonOutlined(
//                 text: AppStrings.viewAll,
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const AllFeaturedSalonsPage()),
//                   );
//                 },
//                 borderColor: const Color.fromRGBO(21, 103, 120, 1),
//                 textColor: const Color.fromRGBO(21, 103, 120, 1),
//               ),
/* SELECTED CODE END */
/* SELECTED CODE END */