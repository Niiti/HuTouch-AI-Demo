import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_images.dart';
import 'package:recipley_app/modules/discover/views/discover_view.dart';
import 'package:recipley_app/modules/home/presentation/views/home_view.dart';
import 'package:recipley_app/modules/notifications/views/notifications_view.dart';
import 'package:recipley_app/modules/profile/views/profile_view.dart';
import 'package:recipley_app/modules/shell/presentation/shell_view_model.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class ShellScreen extends ConsumerWidget {
  const ShellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shellProvider);
    final vm = ref.read(shellProvider.notifier);

    final pages = const [
      HomeView(),
      DiscoverView(),
      NotificationsView(),
      ProfileView(),
    ];

    return Scaffold(
      extendBody: true,
      body: SafeArea(child: pages[state.index]),
      bottomNavigationBar: _BottomNavBar(index: state.index, onTap: vm.changeTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: context.widthUnit * 14.9,
        height: context.heightUnit * 6.0,
        child: Material(
          color: AppColors.primaryDark,
          shape: const CircleBorder(),
          elevation: 12,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(context.widthUnit * 3.2),
              child: Image.asset(AppImages.chef, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const _BottomNavBar({required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final iconSize = context.widthUnit * 6.4;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: AppColors.navShadow, blurRadius: 40, offset: Offset(0, -10))],
      ),
      padding: EdgeInsets.only(
        left: context.widthUnit * 6,
        right: context.widthUnit * 6,
        top: context.heightUnit * 1.6,
        bottom: context.heightUnit * 1.6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavItem(asset: AppImages.bottomHome, selected: index == 0, onTap: () => onTap(0), size: iconSize),
          _NavItem(asset: AppImages.bottomSearch, selected: index == 1, onTap: () => onTap(1), size: iconSize),
          SizedBox(width: context.widthUnit * 14),
          _NavItem(asset: AppImages.bottomNotifications, selected: index == 2, onTap: () => onTap(2), size: iconSize),
          _NavItem(asset: AppImages.bottomProfile, selected: index == 3, onTap: () => onTap(3), size: iconSize),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String asset;
  final bool selected;
  final double size;
  final VoidCallback onTap;
  const _NavItem({required this.asset, required this.selected, required this.onTap, required this.size});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(context.widthUnit * 1.5),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(selected ? AppColors.primary : Colors.transparent, BlendMode.srcATop),
            child: Image.asset(asset, width: size, height: size, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
