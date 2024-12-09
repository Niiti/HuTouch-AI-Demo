import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/order_repository.dart';

class ChangeQuantityUseCase {
  final OrderRepository repository;

  ChangeQuantityUseCase(this.repository);

  Future<Either<Failure, int>> execute(int currentQuantity, bool increase) async {
    int newQuantity = currentQuantity;
    if (increase) {
      newQuantity++;
    } else if (currentQuantity > 1) {
      newQuantity--;
    }
    // Optionally update the repository
    return Right(newQuantity);
  }
}
