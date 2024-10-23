import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final GestureTapCallback onTap;

  const GridItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.12),
              Colors.black.withOpacity(0.12),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Icon(
                icon,
                color: Colors.white.withOpacity(0.75),
                size: 24,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 30,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0,
                  height: 1.25,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  height: 1.1667,
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}