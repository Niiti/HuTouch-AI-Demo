import '../entities/delivery_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure_handler.dart';
abstract class DeliveryRepository {
  Future<Either<Failure, DeliveryEntity>> getDeliveryStatus();
}
