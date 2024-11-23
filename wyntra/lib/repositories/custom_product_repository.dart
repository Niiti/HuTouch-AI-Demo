import '../models/custom_product.dart';

class CustomProductRepository {
  Future<CustomProduct> fetchProduct() async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Mock product data
      return CustomProduct(
        category: 'Women',
        name: 'Printed Yellow Kurta for Women',
        price: 69.69,
        originalPrice: 99.69,
        discount: 60,
        rating: 4.5,
        reviews: 1040,
        description:
            'Lorem ipsum dolor sit amet consectetur. Nulla nulla tempor ut leo in netus fringilla suspendisse molestie...',
        images: [
          'assets/tshirtimage1.png',
          'assets/unsplash_xPJYL0l5Ii8.png',
          'assets/womens-section.png',
        ],
        sizes: ['S', 'M', 'L', 'XL', 'XXL'],
      );
    } catch (e) {
      throw Exception('Failed to fetch product');
    }
  }
}