import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '9:41',
            style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.wifi, color: Colors.black),
              SizedBox(width: 5),
              Text(
                'Carrier',
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 5),
              Icon(Icons.battery_full, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
