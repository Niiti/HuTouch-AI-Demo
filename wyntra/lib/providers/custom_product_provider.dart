import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/custom_product.dart';
import '../repositories/custom_product_repository.dart';

final customProductRepositoryProvider = Provider<CustomProductRepository>((ref) {
  return CustomProductRepository();
});

final customProductProvider = FutureProvider<CustomProduct>((ref) async {
  final repository = ref.read(customProductRepositoryProvider);
  return repository.fetchProduct();
});