import 'package:flutter/material.dart';
import '../../resources/strings.dart';

class AdPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      color: Colors.grey[300],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Strings.adText),
            SizedBox(height: 4),
            CircularProgressIndicator(),
            SizedBox(height: 4),
            Text(Strings.loadingAd),
          ],
        ),
      ),
    );
  }
}
