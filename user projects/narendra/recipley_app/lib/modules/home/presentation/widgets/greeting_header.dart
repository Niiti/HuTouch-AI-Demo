import 'package:flutter/material.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_images.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});
  @override
  Widget build(BuildContext context) {
    final titleSize = context.heightUnit * 2.7;
    final subtitleSize = context.heightUnit * 1.6;
    final iconSize = context.widthUnit * 5.4;
    return Row(
      children: [
        Container(
          width: context.widthUnit * 11,
          height: context.widthUnit * 11,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
          alignment: Alignment.center,
          child: Image.asset(AppImages.sun, width: iconSize, height: iconSize, fit: BoxFit.contain),
        ),
        SizedBox(width: context.widthUnit * 2.5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.greeting, style: TextStyle(fontSize: subtitleSize, color: AppColors.textPrimary, fontWeight: FontWeight.w400)),
              SizedBox(height: context.heightUnit * 0.8),
              Text(AppStrings.userName, style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
            ],
          ),
        ),
        _IconButton(asset: AppImages.cart),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final String asset;
  const _IconButton({required this.asset});
  @override
  Widget build(BuildContext context) {
    final size = context.widthUnit * 9;
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(context.widthUnit * 2.5),
          child: Image.asset(asset, width: size, height: size, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
