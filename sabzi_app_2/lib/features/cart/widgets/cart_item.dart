// Updated code by Hutouch
/* SELECTED CODE START */
import 'package:flutter/material.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/features/cart/models/cart_item.dart' as cart_model;
import 'package:my_project/features/cart/widgets/quantity_control_widget.dart';

class CartItem extends StatelessWidget {
  final cart_model.CartItem cartItem;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItem({
    super.key,
    required this.cartItem,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: deviceHeight * 0.015,
        horizontal: deviceWidth * 0.04,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            cartItem.imagePath,
            width: deviceWidth * 0.25,
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : CircularProgressIndicator();
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image);
            },
          ),
          SizedBox(width: deviceWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
                  style: TextStyle(
                    fontSize: deviceHeight * 0.022,
                    fontFamily: 'Gilroy-Bold',
                    color: ColorPalette.textPrimary,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.005),
                Text(
                  cartItem.subtitle,
                  style: TextStyle(
                    fontSize: deviceHeight * 0.017,
                    fontFamily: 'Gilroy-Medium',
                    color: ColorPalette.textSecondary,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.01),
                QuantityControlWidget(
                  quantity: cartItem.quantity,
                  onQuantityChanged: onQuantityChanged,
                ),
              ],
            ),
          ),
          SizedBox(width: deviceWidth * 0.04),
          Column(
            children: [
              IconButton(
                // Moved IconButton here
                icon: const Icon(Icons.close, color: ColorPalette.secondary),
                onPressed: onRemove,
              ),
              SizedBox(height: 20),
              Text(
                '\$${(cartItem.price * cartItem.quantity).toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: deviceHeight * 0.022,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
/* SELECTED CODE END */