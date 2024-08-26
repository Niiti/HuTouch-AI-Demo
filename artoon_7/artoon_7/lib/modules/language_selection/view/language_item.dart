
import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final String language;
  final String flag;
  final bool isSelected;
  final void Function(String) onSelected;

  LanguageItem({
    required this.language,
    required this.flag,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(language),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
        padding: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Color.fromRGBO(0, 122, 255, 1) : Colors.transparent,
            width: isSelected ? 1.5 : 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: isSelected ? Color.fromRGBO(230, 247, 255, 1) : Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.12),
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 8.0),
            Image.asset(flag, width: 30, height: 30),
            SizedBox(width: 16.0),
            Text(
              language,
              style: TextStyle(fontSize: 16, color: Color.fromRGBO(1, 1, 1, 1)),
            ),
            Spacer(),
            Radio(
              value: true,
              groupValue: isSelected,
              onChanged: (bool? value) {
                onSelected(language);
              },
              activeColor: Color.fromRGBO(0, 122, 255, 1),
            ),
            SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}