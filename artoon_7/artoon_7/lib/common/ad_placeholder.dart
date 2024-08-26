import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String placeholderText;

  LoadingWidget({this.placeholderText = 'Loading...'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Color(0xFFEBEBEB),
            child: Center(
              child: Text(
                'Placeholder', // Placeholder text inside the container
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF787C98),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            placeholderText,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF787C98),
            ),
          ),
        ],
      ),
    );
  }
}