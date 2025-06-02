import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banking_app_hutouch_ai/core/constants/text_style.dart';
import 'package:banking_app_hutouch_ai/core/constants/color_config.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;
  const ScreenHeader({
    super.key,
    required this.title,
    this.leftIcon,
    this.rightIcon,
    this.onLeftPressed,
    this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: Container(
        height: size.height * 0.09,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            if (leftIcon != null)
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: onLeftPressed ?? () => Get.back(),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSurfaceColor,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/arrow.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Center(
                child: Text(
                  title.tr,
                  style: AppTextStyles.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            if (rightIcon != null)
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: onRightPressed,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSurfaceColor,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/notification_icon.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
