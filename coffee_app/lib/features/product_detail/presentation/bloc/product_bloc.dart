// lib/features/product_detail/presentation/bloc/product_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_event.dart';
import 'product_state.dart';
import '../../domain/usecases/fetch_product_detail.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/application_logger.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductDetail fetchProductDetail;

  ProductBloc({required this.fetchProductDetail}) : super(ProductInitial()) {
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  Future<void> _onLoadProductDetail(
      LoadProductDetail event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    final result = await fetchProductDetail.call();
    result.fold(
      (failure) {
        final failureMessage =
            failure is Failure ? failure.message : 'An unknown error occurred';
        ApplicationLogger.error(failureMessage);
        emit(ProductError(failureMessage));
      },
      (product) {
        emit(ProductLoaded(product));
      },
    );
  }
}
