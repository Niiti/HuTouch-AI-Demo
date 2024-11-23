import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../models/custom_product.dart';
import '../../providers/custom_product_provider.dart';
import '../components/custom_product_image_viewer.dart';
import '../components/custom_size_selector.dart';
import 'package:share_plus/share_plus.dart';

class CustomProductPage extends ConsumerStatefulWidget {
  @override
  _CustomProductPageState createState() => _CustomProductPageState();
}

class _CustomProductPageState extends ConsumerState<CustomProductPage> {
  String selectedSize = '';
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productAsyncValue = ref.watch(customProductProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.0),
        child: Container(
          color: AppColors.backgroundColor,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF00002E),
                            blurRadius: 90,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 18,
                        color: AppColors.textColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 45,
                      height: 45,
                      child: IconButton(
                        icon: isFavorite
                            ? Image.asset('assets/heart-filled.png')
                            : Image.asset('assets/heart.png'),
                        iconSize: 18,
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: productAsyncValue.when(
        data: (product) {
          selectedSize = selectedSize.isEmpty ? product.sizes.last : selectedSize;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductImageViewer(images: product.images),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                  children: [
                    Text(
                    product.category,
                    style: AppStyles.subHeadingStyle,
                    ),
                    SizedBox(),
                    Spacer(),
                    IconButton(
                        icon: Image.asset('assets/share.png'),
                        onPressed: () {
                          Share.share('Check out this product: ${product.name}');
                        },
                    ),

                  ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    product.name,
                    style: AppStyles.headingStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: AppStyles.priceStyle,
                      ),
                      SizedBox(width: 16),
                      Text(
                        '${product.discount}% Off',
                        style: AppStyles.discountStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Text(
                    '\$${product.originalPrice.toStringAsFixed(2)}',
                    style: AppStyles.originalPriceStyle,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.ratingColor,
                        size: 18,
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${product.rating} ',
                        style: AppStyles.ratingStyle,
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFD8D8DA),
                          height: 1.6,
                        ),
                      ),
                      Text(
                        ' ${product.reviews}',
                        style: AppStyles.ratingStyle,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.borderColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Select Size',
                    style: AppStyles.headingStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomSizeSelector(
                    sizes: product.sizes,
                    onSelected: (size) {
                      setState(() {
                        selectedSize = size;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16),
                Divider(
                  color: AppColors.borderColor,
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'About the product',
                          style: AppStyles.headingStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    product.description,
                    style: AppStyles.descriptionTextStyle,
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')), 
      ),
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(-2, -4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Add to cart functionality
                  },
                  icon: Image.asset(
                    'assets/Cart.png',
                    width: 16,
                    height: 16,
                  ),
                  label: Text(
                    'Add to Cart',
                    style: AppStyles.addToCartTextStyle,
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    backgroundColor: AppColors.backgroundColor,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Buy now functionality
                  },
                  child: Text(
                    'Buy now',
                    style: AppStyles.buttonTextStyle,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}