import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Image.asset(
            'assets/icons/Back.png',
            width: 24,
            height: 24,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'Request for rent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 40),
        ],
      ),
    );
  }
}
