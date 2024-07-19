import 'package:flutter/material.dart';
import '../../models/language.dart';
import '../../resources/colors.dart'; // Make sure this import is correct

class LanguageListItem extends StatelessWidget {
  final Language language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageListItem({
    Key? key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      elevation: 2,
      color: Colors.white, // Explicitly set card color to white
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(10), // Adjust the border radius as needed
        side: BorderSide(
          color: isSelected
              ? AppColors.buttonEnabled // Use custom color when selected
              : Colors.grey[300]!, // Use a light grey color when not selected
          width: 2, // Border width
        ),
      ),
      child: ListTile(
        title: Text(
          language.name,
          style: TextStyle(
            color: isSelected
                ? AppColors.buttonEnabled // Use custom color when selected
                : Colors.black, // Default color when not selected
          ),
        ),
        leading: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(language
                  .flag), // Ensure the path to the flag image is correct
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey[300]!, // Static grey border for the flag
              width: 2,
            ),
          ),
        ),
        trailing: Radio<bool>(
          value: isSelected,
          groupValue: true,
          onChanged: (value) => onTap(),
          activeColor:
              Color.fromARGB(255, 99, 158, 247), // Use custom color for active state
        ),
        onTap: onTap,
      ),
    );
  }
}
