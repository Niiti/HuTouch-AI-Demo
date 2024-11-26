import 'package:flutter/material.dart';

class SpecificationCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  SpecificationCard(
      {required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
      height: 95,
      decoration: BoxDecoration(
        color: Color.fromRGBO(226, 245, 237, 1),
        border: Border.all(color: Color.fromRGBO(8, 183, 131, 1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(icon, width: 28),
          SizedBox(height: 8),
          Text(
            '$value',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
