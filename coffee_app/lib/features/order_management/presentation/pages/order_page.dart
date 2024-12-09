import 'package:flutter/material.dart';
import '../../../../features/delivery_tracking/presentation/pages/delivery_status_page.dart';
import '../../../product_detail/domain/entities/product_entity.dart';
import '../widgets/delivery_address_section.dart';
import '../widgets/payment_method_section.dart';
import '../widgets/payment_summary_section.dart';
import '../widgets/item_order_section.dart';
import '../widgets/discount_section.dart';
import '../widgets/toggle_section.dart';
import '../widgets/header_section.dart';

class OrderPage extends StatelessWidget {
  final ProductEntity product;

  const OrderPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                HeaderSection(width: screenWidth),
                SizedBox(height: screenHeight * 0.02),

                // Toggle Section (Deliver / Pick-Up)
                ToggleSection(
                  isDeliver: true,
                  onToggle: (isDeliver) {
                    // Handle toggle logic here
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                // Delivery Address Section
                DeliveryAddressSection(
                  address: "123 Coffee Street, Java City",
                  onEdit: () {
                    // Handle address editing logic
                  },
                  onAddNote: () {
                    // Handle adding note logic
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                // Item Order Section
                ItemOrderSection(
                  product: product,
                  quantity: 1,
                  onQuantityChange: (increase) {
                    // Handle quantity change logic
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                // Discount Section
                DiscountSection(
                  onTap: () {
                    // Handle discount details logic
                  },
                ),
                SizedBox(height: screenHeight * 0.03),

                // Payment Summary Section
                PaymentSummarySection(
                  price: product.price,
                  deliveryFee: 5.0,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Payment Method Section
                PaymentMethodSection(
                  onOrder: () {
                    // Navigate to DeliveryStatusPage when "Order" is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeliveryStatusPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
