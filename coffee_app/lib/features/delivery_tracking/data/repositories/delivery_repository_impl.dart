import '../../domain/entities/delivery_entity.dart';
import '../../domain/repositories/delivery_repository.dart';
import '../datasources/delivery_remote_datasource.dart';
import '../../../../core/network/network_information.dart';
import '../../../../core/error/failure_handler.dart';
import '../../../../core/error/custom_exceptions.dart';
import '../../../../core/utils/application_logger.dart';
import '../../../../core/error/error_handler.dart';
import 'package:dartz/dartz.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  final DeliveryRemoteDataSource remoteDataSource;
  final NetworkInformation networkInfo;
  final ErrorHandler2 errorHandler; // Renamed instance to avoid conflict
  final ApplicationLogger2 logger;

  DeliveryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
    required this.errorHandler, // Updated parameter name
    required this.logger,
  });

  @override
  Future<Either<Failure, DeliveryEntity>> getDeliveryStatus() async {
    try {
      if (await networkInfo.isConnected) {
        final remoteStatus = await remoteDataSource.fetchDeliveryStatus();
        return Right(remoteStatus);
      } else {
        return Left(CacheFailure2('No Internet Connection'));
      }
    } on CustomException catch (e) {
      errorHandler.handleError(e); // Updated to use renamed instance
      return Left(ServerFailure2(e.message));
    } catch (e) {
      errorHandler.handleError(e); // Updated to use renamed instance
      return Left(ServerFailure2('Unexpected Error'));
    }
  }
}
