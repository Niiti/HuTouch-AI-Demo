import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';

class ShowDiscountDetailsUseCase {
  final OrderRepository repository;

  ShowDiscountDetailsUseCase(this.repository);

  Future<Either<Failure, String>> execute() async {
    // Implement logic to fetch discount details
    // For simplicity, return a static string
    return Right('Discount Details: 10% off on orders above \$50');
  }
}
