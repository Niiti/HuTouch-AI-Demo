import 'package:flutter/material.dart';

class SpecialistCardWidget extends StatelessWidget {
  final String name;
  final String imageAsset;
  const SpecialistCardWidget({
    required this.name,
    required this.imageAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Column(
        children: [
          ClipOval(
            child: Image.asset(
              imageAsset,
              width: size.width * 0.2,
              height: size.width * 0.2,
              fit: BoxFit.cover,
              errorBuilder: (c, e, s) => const Icon(Icons.broken_image),
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            name,
            style: TextStyle(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
