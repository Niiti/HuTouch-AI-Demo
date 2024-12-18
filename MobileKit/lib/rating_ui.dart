import 'package:flutter/material.dart';
import 'videoscreen_ui.dart';
class RatingUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.05;
    final starSize = size.width * 0.1;
    final borderRadius = size.width * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF6EBF8B),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: padding, vertical: padding / 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('9:41',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.signal_cellular_alt, color: Colors.white),
                          SizedBox(width: 4),
                          Icon(Icons.wifi, color: Colors.white),
                          SizedBox(width: 4),
                          Icon(Icons.battery_full, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CardComponent(
                      starSize: starSize,
                      borderRadius: borderRadius,
                      padding: padding,
                      size: size,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    required this.starSize,
    required this.borderRadius,
    required this.padding,
    required this.size,
  }) : super(key: key);

  final double starSize;
  final double borderRadius;
  final double padding;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StarsRow(starSize: starSize),
          SizedBox(height: padding),
          TitleText(),
          SizedBox(height: padding / 2),
          DescriptionText(size: size, padding: padding),
          SizedBox(height: padding),
          LoveItButton(padding: padding, borderRadius: borderRadius),
          SizedBox(height: padding / 2),
          FeedbackLink(),
        ],
      ),
    );
  }
}

class StarsRow extends StatelessWidget {
  const StarsRow({
    Key? key,
    required this.starSize,
  }) : super(key: key);

  final double starSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: Colors.orange,
          size: starSize,
        );
      }),
    );
  }
}

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Text(
      'Rate our app',
      style: TextStyle(
        fontSize: size.width * 0.08,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    Key? key,
    required this.size,
    required this.padding,
  }) : super(key: key);

  final Size size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding / 2),
      child: Text(
        'Consequat velit qui adipisicing sunt do reprehenderit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua esse ex dolore esse. Consequat velit qui adipisicing sunt.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: size.width * 0.04,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}

class LoveItButton extends StatelessWidget {
  const LoveItButton({
    Key? key,
    required this.padding,
    required this.borderRadius,
  }) : super(key: key);

  final double padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GeneratedUI()),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF6EBF8B),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(
          vertical: padding / 2,
        ),
        child: Center(
          child: Text(
            'I love it!',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


class FeedbackLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextButton(
      onPressed: () {
        print('Don’t like the app? Let us know.');
      },
      child: Text(
        'Don’t like the app? Let us know.',
        style: TextStyle(
          fontSize: size.width * 0.04,
          color: Color(0xFF6EBF8B),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
