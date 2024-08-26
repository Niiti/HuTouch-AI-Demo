
import 'package:flutter/material.dart';

class CategoriesTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      padding: EdgeInsetsDirectional.only(end:16,start:1),
      child: TabBar(
        labelColor: Color.fromRGBO(1, 129, 253, 1),
        unselectedLabelColor: Color.fromRGBO(73, 76, 97, 1),
        indicatorColor: Color.fromRGBO(1, 129, 253, 1),
        dividerColor: Colors.transparent,
        isScrollable: true,
        tabs: [
          Tab(text: 'TRENDING'),
          Tab(text: 'FASHION'),
          Tab(text: 'ANIME'),
          Tab(text: 'DIGITAL ART'),
        ],
      ),
    );
  }
}