import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';

class CustomSearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const CustomSearchWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.04,
        vertical: size.height * 0.015,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(241, 242, 242, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Color(0xFF7C7C7C)),
          SizedBox(width: size.width * 0.02),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
