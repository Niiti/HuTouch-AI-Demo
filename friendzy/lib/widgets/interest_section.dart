// lib/widgets/interest_section.dart

import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/interest_chip_data.dart';
import '../screens/interests_screen.dart';

class InterestSection extends StatelessWidget {
  final List<InterestChipData> interests;
  final Function(int) onInterestSelected;

  InterestSection({required this.interests, required this.onInterestSelected});

  void navigateToInterests(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InterestsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Interest',
                style: TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kPrimaryColor,
                  height: 1.2,
                ),
              ),
              InkWell(
                onTap: () => navigateToInterests(context),
                child: Text(
                  'View all',
                  style: TextStyle(
                    fontFamily: 'Hellix',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: kAccentColor,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(interests.length, (index) {
              return ChoiceChip(
                label: Text(
                  interests[index].label,
                  style: TextStyle(
                    fontFamily: 'Hellix',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                        interests[index].isSelected ? kWhiteColor : kTextColor,
                    height: 1.5,
                  ),
                ),
                selected: interests[index].isSelected,
                selectedColor: kAccentColor,
                backgroundColor: kWhiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: interests[index].isSelected
                        ? Colors.transparent
                        : kTextColor,
                  ),
                ),
                onSelected: (bool selected) {
                  onInterestSelected(index);
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
