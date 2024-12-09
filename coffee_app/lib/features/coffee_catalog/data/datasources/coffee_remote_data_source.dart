import '../models/coffee_model.dart';

abstract class CoffeeRemoteDataSource {
  Future<List<CoffeeModel>> fetchCoffees();
}

class CoffeeRemoteDataSourceImpl implements CoffeeRemoteDataSource {
  @override
  Future<List<CoffeeModel>> fetchCoffees() async {
    // Implement API call here
    // For demonstration, returning static data
    return [
      CoffeeModel(
        image: 'assets/images/coffee_image_1.png',
        name: 'Caffe Mocha',
        description: 'Deep Foam',
        price: 4.53,
        rating: 4.8,
        category: 'Latte',
      ),
      CoffeeModel(
        image: 'assets/images/coffee_image_2.png',
        name: 'Espresso',
        description: 'Rich and Strong',
        price: 3.50,
        rating: 4.5,
        category: 'Americano',
      ),
      CoffeeModel(
        image: 'assets/images/coffee_image_3.png',
        name: 'Caramel Macchiato',
        description: 'Sweet and Creamy',
        price: 5.00,
        rating: 4.7,
        category: 'Macchiato',
      ),
      CoffeeModel(
        image: 'assets/images/coffee_image_4.png',
        name: 'Flat White',
        description: 'Smooth and Silky',
        price: 4.75,
        rating: 4.6,
        category: 'Latte',
      ),
    ];
  }
}