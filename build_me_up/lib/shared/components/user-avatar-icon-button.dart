import 'package:flutter/material.dart';

class UserAvatarIconButton extends StatelessWidget {
  const UserAvatarIconButton({
    super.key,
    required this.onTap,
    this.size = 40,
    this.backgroundColor = const Color(0xFF426764),
    this.iconColor = Colors.white,
    this.imageProvider,
  });

  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: size,
          height: size,
          child: imageProvider != null
              ? Ink.image(image: imageProvider!, fit: BoxFit.cover)
              : Icon(Icons.person, color: iconColor, size: size * 0.55),
        ),
      ),
    );
  }
}