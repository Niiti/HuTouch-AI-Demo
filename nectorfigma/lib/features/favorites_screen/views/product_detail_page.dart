import 'package:flutter/material.dart';
import 'package:nectorfigma/core/constants/app_strings.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.productDetailTitle)),
      body: const Center(child: Text('Product details go here')),
    );
  }
}
