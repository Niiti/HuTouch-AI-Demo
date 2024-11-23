
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentsRepository {
  final String _baseUrl = 'https://api.stripe.com';
  final String _secretKey = 'YOUR_SECRET_KEY'; // Replace with your real Stripe secret key

  Future<Map<String, dynamic>> createPaymentIntent(double amount, String currency) async {
    final Uri url = Uri.parse('$_baseUrl/v1/payment_intents');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $_secretKey',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'amount': (amount * 100).toInt().toString(), // Amount in cents
        'currency': currency,
        'payment_method_types[]': 'card',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create Payment Intent');
    }
  }
}