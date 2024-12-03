import 'package:flutter/material.dart';
import '../../../core/utils/responsive_util.dart';

class InstructionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = ResponsiveUtil.getWidth(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '1. Prepare all ingredients.\n2. Mix the vegetables.\n3. Add the proteins.\n4. Serve fresh.',
        style: TextStyle(
          fontFamily: 'Sofia Pro',
          fontSize: width * 0.04,
          color: Color.fromRGBO(115, 129, 137, 1),
        ),
      ),
    );
  }
}
