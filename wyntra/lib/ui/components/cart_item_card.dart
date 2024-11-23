import 'package:flutter/material.dart';
import '../../models/cart_item.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';
import 'quantity_dialog.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onRemove;
  final Function(int) onQuantityChange;

  CartItemCard({
    required this.cartItem,
    required this.onRemove,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(2, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F5),
                    image: DecorationImage(
                      image: AssetImage(cartItem.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.name,
                          style: AppStyles.inter12w600,
                          maxLines: 2,
                        ),
                        Spacer(),
                        Text(
                          '\$${cartItem.price}',
                          style: AppStyles.inter16w600,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            int? selectedQuantity = await showDialog<int>(
                              context: context,
                              builder: (context) {
                                return QuantityDialog(
                                  currentQuantity: cartItem.quantity,
                                );
                              },
                            );
                            if (selectedQuantity != null) {
                              onQuantityChange(selectedQuantity);
                            }
                          },
                          child: Container(
                            width: 64,
                            height: 25,
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 8),
                                Text(
                                  'Qty: ${cartItem.quantity}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: 16,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 8),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 16,
                ),
                onPressed: onRemove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}