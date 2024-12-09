import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handling.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/error/error_handling.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/coffee.dart';
import '../../domain/repositories/coffee_repository.dart';
import '../models/coffee_model.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final NetworkInfo networkInfo;
  // Add data sources like remote and local here

  CoffeeRepositoryImpl({required this.networkInfo});

  @override
  Future<Either<Failure, List<Coffee>>> getCoffees() async {
    return await handleError(() async {
      if (await networkInfo.isConnected) {
        // Fetch from remote
        // For demonstration, using static data
        List<CoffeeModel> coffees = [
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
        return Right(coffees);
      } else {
        throw ServerException();
      }
    });
  }
}