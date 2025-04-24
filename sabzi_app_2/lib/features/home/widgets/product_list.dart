import 'package:flutter/material.dart';
import 'package:my_project/features/home/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Scrollbar(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            ProductCard(
              imagePath: 'assets/images/banana.png',
              title: 'Organic Bananas',
              price: '\$4.99',
              details: '7pcs, Priceg',
            ),
            SizedBox(width: 8),
            ProductCard(
              imagePath: 'assets/images/red_apples.png',
              title: 'Red Apple',
              price: '\$4.99',
              details: '1kg, Priceg',
            ),
          ],
        ),
      ),
    );
  }
}