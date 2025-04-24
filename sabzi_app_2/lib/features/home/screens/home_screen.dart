import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core/localization/app_localizations.dart';
import 'package:my_project/features/home/bloc/home_cubit.dart';
import 'package:my_project/features/home/widgets/app_header.dart';
import 'package:my_project/features/home/widgets/search_bar.dart';
import 'package:my_project/features/home/widgets/promotional_banner.dart';
import 'package:my_project/features/home/widgets/section_header.dart';
import 'package:my_project/features/home/widgets/product_list.dart';
import 'package:my_project/features/home/widgets/category_list.dart';
import 'package:my_project/features/home/widgets/bottom_navigation_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  void _searchProducts(String query) {
    // Implementation for searching products.
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final homeCubit = context.read<HomeCubit>();
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.05,
                      vertical: constraints.maxHeight * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppHeader(
                          selectedLocation: state.selectedLocation,
                          locations: homeCubit.locations,
                          onLocationChanged: homeCubit.changeLocation,
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        SearchBar_(
                          controller: searchController,
                          onSearch: _searchProducts,
                          hintText: localizations.searchStore,
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        PromotionalBanner(
                          banners: homeCubit.banners,
                          currentIndex: state.currentBannerIndex,
                          onNext: homeCubit.nextBanner,
                          onPrevious: homeCubit.previousBanner,
                        ),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        SectionHeader(title: localizations.exclusiveOffer),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        const ProductList(),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        SectionHeader(title: localizations.bestSelling),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        const ProductList(),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        SectionHeader(title: localizations.groceries),
                        SizedBox(height: constraints.maxHeight * 0.02),
                        const CategoryList(),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}