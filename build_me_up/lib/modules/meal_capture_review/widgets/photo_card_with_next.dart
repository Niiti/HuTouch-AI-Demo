import 'package:build_me_up/widgets/buttons/hacker_buttons.dart';
import 'package:flutter/material.dart';
import 'package:build_me_up/core/extensions/context_extensions.dart';

class PhotoCardWithNext extends StatelessWidget {
  final String assetPath;
  final VoidCallback onNext;

  const PhotoCardWithNext({
    super.key,
    required this.assetPath,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final nextHeight = context.heightUnit * 5.2;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.heightUnit * 2.2),
              image: DecorationImage(
                image: AssetImage(assetPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: context.heightUnit * 1.8),
          child: PrimaryButton(
            text: 'Next',
            onPressed: onNext,
            height: nextHeight,
            borderRadius: BorderRadius.circular(nextHeight / 2),
          ),
        ),
      ],
    );
  }
}
