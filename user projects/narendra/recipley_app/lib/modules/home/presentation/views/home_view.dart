import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipley_app/core/constants/app_colors.dart';
import 'package:recipley_app/core/constants/app_strings.dart';
import 'package:recipley_app/modules/home/presentation/viewmodels/home_view_model.dart';
import 'package:recipley_app/modules/home/presentation/widgets/category_selector.dart';
import 'package:recipley_app/modules/home/presentation/widgets/featured_carousel.dart';
import 'package:recipley_app/modules/home/presentation/widgets/greeting_header.dart';
import 'package:recipley_app/modules/home/presentation/widgets/popular_recipes_list.dart';
import 'package:recipley_app/modules/home/presentation/widgets/section_header.dart';
import 'package:recipley_app/utils/context_extensions.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    final vm = ref.read(homeViewModelProvider.notifier);
    final isPortrait = ContextExtensionss(context).isPortrait;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 6),
          child: LayoutBuilder(
            builder: (_, __) {
              final vGap = context.heightUnit * 2.2;

              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: context.screenHeight - context.heightUnit * 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: vGap),
                      const GreetingHeader(),
                      SizedBox(height: vGap),
                      Text(
                        AppStrings.featured,
                        style: TextStyle(
                          fontSize: context.heightUnit * 2.3,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: context.heightUnit * 1.5),
                      if (state.loading && state.featured.isEmpty)
                        SizedBox(height: context.heightUnit * 22, child: const Center(child: CircularProgressIndicator()))
                      else
                        FeaturedCarousel(isPortrait: isPortrait, items: state.featured),
                      SizedBox(height: vGap),
                      SectionHeaderWithSeeAll(title: AppStrings.category, onTap: () {}),
                      SizedBox(height: context.heightUnit * 1.2),
                      CategorySelector(
                        categories: state.categories,
                        selectedIndex: state.selectedCategoryIndex,
                        onSelect: vm.selectCategory,
                      ),
                      SizedBox(height: vGap),
                      SectionHeaderWithSeeAll(title: AppStrings.popular, onTap: () {}),
                      SizedBox(height: context.heightUnit * 1.2),
                      if (state.loading && state.popular.isEmpty)
                        SizedBox(height: context.heightUnit * 22, child: const Center(child: CircularProgressIndicator()))
                      else
                        PopularRecipesList(items: state.popular),
                      SizedBox(height: context.heightUnit * 10),
                      if (state.error != null)
                        Padding(
                          padding: EdgeInsets.only(top: context.heightUnit * 1.5),
                          child: Text(state.error!, style: const TextStyle(color: Colors.red)),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: AppColors.bg,
    );
  }
}
