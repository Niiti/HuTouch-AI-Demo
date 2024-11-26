
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';
import '../components/product_card.dart';
import '../../providers/product_provider.dart';

class TrendingNowExpansionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Now', style: AppStyles.headingStyle),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          // Expanded Content
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final trendingProductsAsync = ref.watch(trendingProductsProvider);

                return trendingProductsAsync.when(
                  data: (products) {
                    return GridView.builder(
                      padding: EdgeInsets.all(16.0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          product: product,
                          onFavorite: () {
                            // Handle favorite functionality
                          },
                        );
                      },
                    );
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error loading products')),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}