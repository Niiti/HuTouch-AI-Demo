
import 'package:flutter/material.dart';

class AdSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Center(
        child: Text(
          'AD',
          style: TextStyle(
            color: Color.fromRGBO(153, 153, 153, 1),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}