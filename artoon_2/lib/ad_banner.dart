import 'package:flutter/material.dart';

class AdBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool adLoaded = false;

    return Container(
      color: Colors.grey[200],
      width: double.infinity,
      height: 176.0,
      child: Stack(
        children: [
          Center(
            child: adLoaded
                ? Text('Ad Content')
                : Text(
                    'Loading...',
                    style: TextStyle(color: Colors.grey),
                  ),
          ),
          Positioned(
            top: 8.0,
            left: 8.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
              color: Colors.black.withOpacity(0.3),
              child: Text(
                'Ad',
                style:
                    TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
