import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchTrendingProducts() async {
    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Ideally, fetch data from API or database
      return [
        Product(
          imagePath: 'assets/unsplash_xPJYL0l5Ii8.png',
          category: 'Men',
          productName: 'Brown Leather Jacket for men',
          price: '\$69.69',
          rating: '4.5',
          reviews: '1040',
        ),
        Product(
          imagePath: 'assets/unsplash_xPJYL0l5Ii8.png',
          category: 'Women',
          productName: 'Printed Yellow Kurta for women',
          price: '\$104.69',
          rating: '4.5',
          reviews: '1040',
        ),
      ];
    } catch (e) {
      // Error handling
      throw Exception('Failed to load products');
    }
  }
}
