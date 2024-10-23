
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
        onChanged: (text) {
          // Handle change in search text
          // Example: ref.read(searchTextProvider.notifier).state = text;
        },
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.25,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          prefixIcon: Icon(Icons.search, color: Colors.black),
          hintText: 'Search songs, artist, album o.',
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.25,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}