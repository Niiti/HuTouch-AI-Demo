import 'package:flutter/material.dart';
import '../../../product_detail/domain/entities/product_entity.dart';

class ItemOrderSection extends StatelessWidget {
  final ProductEntity product;
  final int quantity;
  final ValueChanged<bool> onQuantityChange;

  const ItemOrderSection({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onQuantityChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage(product.imageUrl), // Ensure the path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),

          // Product Name
          Expanded(
            child: Text(
              product.name,
              style: Theme.of(context).textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Increment-Decrement Controls
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () => onQuantityChange(false),
              ),
              Text(
                quantity.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => onQuantityChange(true),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
