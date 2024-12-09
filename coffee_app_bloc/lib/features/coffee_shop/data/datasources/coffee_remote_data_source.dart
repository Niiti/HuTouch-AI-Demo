import '../models/coffee_product_model.dart';

abstract class CoffeeRemoteDataSource {
  Future<List<CoffeeProductModel>> fetchProducts();
}

class CoffeeRemoteDataSourceImpl implements CoffeeRemoteDataSource {
  @override
  Future<List<CoffeeProductModel>> fetchProducts() async {
    // Return hardcoded data
    return [
      CoffeeProductModel(
        imageUrl: 'assets/images/coffee_image_1.png',
        rating: '4.5',
        title: 'Espresso',
        subtitle: 'Strong and bold',
        price: '\$2.99',
        category: 'All Coffee',
      ),
      CoffeeProductModel(
        imageUrl: 'assets/images/coffee_image_2.png',
        rating: '4.0',
        title: 'Cappuccino',
        subtitle: 'Smooth and creamy',
        price: '\$3.49',
        category: 'Machiatto',
      ),
      CoffeeProductModel(
        imageUrl: 'assets/images/coffee_image_3.png',
        rating: '4.8',
        title: 'Latte',
        subtitle: 'Mild and sweet',
        price: '\$3.99',
        category: 'Latte',
      ),
      CoffeeProductModel(
        imageUrl: 'assets/images/coffee_image_4.png',
        rating: '4.3',
        title: 'Mocha',
        subtitle: 'Rich and chocolatey',
        price: '\$4.49',
        category: 'Americano',
      ),
    ];
  }
}
