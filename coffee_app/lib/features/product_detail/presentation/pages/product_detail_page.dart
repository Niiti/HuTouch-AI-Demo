import 'package:flutter/material.dart';
import '../../domain/entities/product_entity.dart';
import '../widgets/product_header_widget.dart';
import '../widgets/product_image_widget.dart';
import '../widgets/product_size_selector_widget.dart';
import '../widgets/purchase_button_widget.dart';
import '../../../order_management/presentation/pages/order_page.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductEntity product;

  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  bool isFavorite = false;
  bool isDescriptionExpanded = false;
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    final product = widget.product; // Use product passed from constructor
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeaderWidget(
                isFavorite: isFavorite,
                onFavoriteToggle: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                screenWidth: screenWidth,
              ),
              ProductImageWidget(
                imageUrl: product.imageUrl,
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Product Name and Ice/Hot
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Ice/Hot',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: screenWidth * 0.045),
                        SizedBox(width: screenWidth * 0.01),
                        Text(
                          '${product.rating} (${product.reviewCount})',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Icons Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton('assets/images/delivery_icon.png', screenWidth),
                    _buildIconButton('assets/images/coffee_icon.png', screenWidth),
                    _buildIconButton('assets/images/milk_icon.png', screenWidth),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDescriptionExpanded = !isDescriptionExpanded;
                        });
                      },
                      child: Text(
                        isDescriptionExpanded
                            ? '${product.description} Read Less'
                            : '${product.description} Read More',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: screenWidth * 0.035,
                          fontWeight: isDescriptionExpanded ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Size Selector
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: ProductSizeSelectorWidget(
                  selectedSize: selectedSize,
                  onSizeSelected: (size) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                  screenWidth: screenWidth,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Price and Purchase
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(fontSize: 14.0, color: Colors.grey),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFC67C4E),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Purchase Button
                    PurchaseButtonWidget(
                      screenWidth: screenWidth,
                      onPressed: () {
                        // Navigate to OrderPage with the selected product
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(product: product),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(String assetPath, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(237, 237, 237, 0.35),
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
      ),
      child: Image.asset(
        assetPath,
        width: screenWidth * 0.05,
      ),
    );
  }
}
