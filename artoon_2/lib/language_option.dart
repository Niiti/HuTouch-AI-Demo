import 'package:flutter/material.dart';

class LanguageOption extends StatelessWidget {
  final Map<String, String> language;
  final bool isSelected;
  final Function(String) onSelect;

  LanguageOption({
    required this.language,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(language['name']!);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(language['icon']!, width: 30, height: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                language['name']!,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Radio(
              value: language['name']!,
              groupValue: isSelected ? language['name'] : null,
              onChanged: (value) {
                onSelect(language['name']!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
