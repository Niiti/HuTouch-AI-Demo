import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wyntra/models/cart_item.dart';
import 'package:wyntra/ui/pages/home_page.dart';
import 'package:wyntra/ui/pages/main_scree.dart';
import '../../constants/app_styles.dart';
import '../../constants/app_colors.dart';
import '../components/CustomBottomNavBar.dart';
import '../components/cart_item_card.dart';
import '../components/checkout_button.dart';
import '../../providers/cart_provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// For mocking
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class ShoppingCartScreen extends ConsumerWidget {
  final Dio _dio = Dio(); // Use Dio for HTTP requests

  ShoppingCartScreen({Key? key}) : super(key: key) {
    // Only add interceptors in debug mode
    assert(() {
      _setupMockInterceptor();
      return true;
    }());
  }

  void _setupMockInterceptor() {
    final dioAdapter = DioAdapter(dio: _dio);

    // Mock the POST request to create-payment-intent
    dioAdapter.onPost(
      'https://your-backend.com/create-payment-intent',
      (request) {
        // Return a mocked client_secret
        request.reply(200, {
          'clientSecret': 'sk_test_51Mf4fPSDm6w3ySR7efC19JlwtyKPG10jt5yMOcRSKO0P9tpkRR4cmWT9JUn7Oq2cyUfbfUUcuObhYS7BGSpwe2a900qtofDdh6',
        });
      },
      data: Matchers.any,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          titleSpacing: 16,
          title: Text(
            'My Cart',
            style: AppStyles.montserrat22w600,
          ),
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.grey[300],
              ),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return CartItemCard(
                  cartItem: cartItems[index],
                  onRemove: () => ref.read(cartProvider.notifier).removeCartItem(index),
                  onQuantityChange: (newQuantity) =>
                      ref.read(cartProvider.notifier).updateQuantity(index, newQuantity),
                );
              },
            ),
          ),
          CheckoutButton(
            onCheckout: () async {
              await _handleCheckout(context, cartItems);
            },
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 2, // Index for 'MY CART' tab
        onTap: (index) {
          // Handle navigation based on the tapped index
          if (index != 2) {
            // If the selected tab is not 'MY CART', navigate accordingly
            switch (index) {
              case 0:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WyntraHomePage()),
                );
                break;
              case 1:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
                break;
              case 3:
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MoreScreen()),
                );
                break;
            }
          }
        },
      ),
    );
  }

  Future<void> _handleCheckout(BuildContext context, List<CartItem> cartItems) async {
    double totalAmount = calculateTotalAmount(cartItems);
    String currency = 'usd'; // Default currency

    try {
      // Use Dio instead of http for mocking
      final response = await _dio.post(
        'https://your-backend.com/create-payment-intent',
        data: json.encode({
          'amount': (totalAmount * 100).toInt(), // Amount in cents
          'currency': currency,
        }),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent');
      }

      final jsonResponse = response.data;
      final clientSecret = jsonResponse['clientSecret'];

      // Initialize payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: clientSecret,
          merchantDisplayName: 'Kshitij',
        ),
      );

// Present the payment sheet
await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful!')),
      );


    } catch (e) {
      // Handle errors from Stripe
      if (e is StripeException) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment failed: ${e.error.localizedMessage}')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Payment failed: $e')),
        );
      }
    }
  }

  double calculateTotalAmount(List<CartItem> items) {
    return items.fold(0.0, (previousValue, item) => previousValue + item.price * item.quantity);
  }
}