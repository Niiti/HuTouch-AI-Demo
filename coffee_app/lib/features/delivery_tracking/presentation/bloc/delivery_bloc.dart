import 'package:flutter_bloc/flutter_bloc.dart';
import 'delivery_event.dart';
import 'delivery_state.dart';
import '../../domain/usecases/get_delivery_status.dart';
import '../../../../core/error/failure_handler.dart';
import '../../../../core/utils/application_logger.dart';

class DeliveryBloc extends Bloc<DeliveryEvent, DeliveryState> {
  final GetDeliveryStatus getDeliveryStatus;
  final ApplicationLogger2 logger;

  DeliveryBloc({
    required this.getDeliveryStatus,
    required this.logger,
  }) : super(DeliveryInitial()) {
    on<FetchDeliveryStatusEvent>((event, emit) async {
      emit(DeliveryLoading());
      final result = await getDeliveryStatus.execute();
      result.fold(
        (failure) {
          // Safely access the message based on the failure type
          String failureMessage;
          if (failure is ServerFailure2) {
            failureMessage = failure.message;
          } else if (failure is CacheFailure2) {
            failureMessage = failure.message;
          } else {
            failureMessage = 'An unknown error occurred';
          }

          emit(DeliveryError(message: failureMessage));
          logger.logError(failureMessage);
        },
        (delivery) {
          emit(DeliveryLoaded(delivery: delivery));
          logger.log('Delivery status loaded successfully');
        },
      );
    });
  }
}
