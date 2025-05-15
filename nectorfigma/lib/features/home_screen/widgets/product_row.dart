import 'package:flutter/material.dart';
import 'package:nectorfigma/features/home_screen/widgets/product_card.dart';

class ProductRow extends StatelessWidget {
  final List<ProductCard> products;
  const ProductRow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Row(children: products.map((e) => Expanded(child: e)).toList());
  }
}
