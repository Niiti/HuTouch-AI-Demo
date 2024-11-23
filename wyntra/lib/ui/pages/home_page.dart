import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wyntra/ui/components/CustomBottomNavBar.dart';
import 'package:wyntra/ui/pages/main_scree.dart';
import 'package:wyntra/ui/pages/shopping_cart_screen.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';
import '../components/category_icon.dart';
import '../components/product_card.dart';
import '../../providers/product_provider.dart';
import '../../models/product.dart';
import '../components/trending_now_expansion_page.dart';

class WyntraHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingProductsAsync = ref.watch(trendingProductsProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/logo.png', // Logo image
                  height: 32,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 8),
                Text(
                  'Wyntra',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF292929),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            
            IconButton(
              icon: Image.asset(
                'assets/search.png',
                height: 24,
                width: 24,
                color: Color(0xFF1E1E1E),
              ),
                onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
                },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  // User profile access
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/Avatar.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Promotional Banner
          Container(
            height: 230,
            child: Stack(
              children: [
                Image.asset(
                  'assets/unsplash_xPJYL0l5Ii8.png', // Background image
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-0.7125, 0.5),
                      end: Alignment(1.0, 0.5),
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0.65),
                        Color.fromRGBO(0, 0, 0, 0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#Fashion Day',
                        style: AppStyles.promotionTitleStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '80% Off',
                        style: AppStyles.promotionSubtitleStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Discover fashion that suits your style',
                        style: AppStyles.promotionDescriptionStyle,
                      ),
                      SizedBox(height: 24),
                      OutlinedButton(
                        onPressed: () {
                          // Promotional button action
                        },
                        child: Text(
                          'Check this out',
                          style: AppStyles.buttonTextStyle,
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                // Pagination Indicator
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == 0
                                ? AppColors.primaryColor
                                : Color(0xFFD9D9D9).withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Category Icons
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryIcon(
                  imagePath: 'assets/mens_section.png',
                  label: 'Men',
                  backgroundColor: Color(0xFFDAE4FF),
                  onTap: () {
                    // Navigate to Men's category
                  },
                ),
                CategoryIcon(
                  imagePath: 'assets/womens-section.png',
                  label: 'Women',
                  backgroundColor: Color(0xFFFFDAFA),
                  onTap: () {
                    // Navigate to Women's category
                  },
                ),
                CategoryIcon(
                  imagePath: 'assets/kids-section.png',
                  label: 'Kids',
                  backgroundColor: Color(0xFFDEFEFD),
                  onTap: () {
                    // Navigate to Kids' category
                  },
                ),
                CategoryIcon(
                  imagePath: 'assets/jewellery-section.png',
                  label: 'Jewellery',
                  backgroundColor: Color(0xFFFFEED8),
                  onTap: () {
                    // Navigate to Jewellery category
                  },
                ),
              ],
            ),
          ),
          // Trending Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Now!',
                  style: AppStyles.headingStyle,
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to additional trending products
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrendingNowExpansionPage(),
                      ),
                    );
                  },
                  child: Text(
                    'See More',
                    style: AppStyles.subHeadingStyle,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          // Product Cards
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: trendingProductsAsync.when(
              data: (products) {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onFavorite: () {
                  // Favorite functionality
                  },
                );
                },
              );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error loading products')), 
            ),
            ),
          SizedBox(height: 16),
        ],
      ),
bottomNavigationBar: CustomBottomNavBar(
  currentIndex: 0, // Index for 'HOME' tab
  onTap: (index) {
    if (index != 0) {
      // Navigate to the selected screen
      switch (index) {
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CategoriesScreen()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ShoppingCartScreen()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MoreScreen()),
          );
          break;
      }
    }
  },
),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search result display
    return Center(
      child: Text('Search results for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions
    final suggestions = query.isEmpty
        ? []
        : ['Suggestion 1', 'Suggestion 2', 'Suggestion 3']
            .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}