import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';

class EditAddressUseCase {
  final OrderRepository repository;

  EditAddressUseCase(this.repository);

  Future<Either<Failure, String>> execute(String newAddress) async {
    // Implement the use case logic, possibly updating address in repository
    // For simplicity, return Right with the new address
    return Right(newAddress);
  }
}
