import '../entities/delivery_entity.dart';
import '../repositories/delivery_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure_handler.dart';

class GetDeliveryStatus {
  final DeliveryRepository repository;

  GetDeliveryStatus(this.repository);

  Future<Either<Failure, DeliveryEntity>> execute() {
    return repository.getDeliveryStatus();
  }
}
