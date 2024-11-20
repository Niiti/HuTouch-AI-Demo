import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String feature;
  final String value;

  FeatureCard({required this.feature, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Color.fromRGBO(226, 245, 237, 1),
        border: Border.all(color: Color.fromRGBO(8, 183, 131, 1)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            feature,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
