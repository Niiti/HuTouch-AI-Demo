import 'package:get/get.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class HomeController extends GetxController {
  var categories = <Category>[].obs;
  var products = <Product>[].obs;
  var selectedIndex = 0.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    fetchProducts();
    super.onInit();
  }

  void fetchCategories() {
    categories.assignAll([
      Category(image: 'assets/images/beauty.png', label: 'Beauty'),
      Category(image: 'assets/images/fashion.png', label: 'Fashion'),
      Category(image: 'assets/images/kids.png', label: 'Kids'),
      Category(image: 'assets/images/mens.png', label: 'Mens'),
      Category(image: 'assets/images/womens.png', label: 'Womens'),
      Category(image: 'assets/images/gifts.png', label: 'Gifts'),
    ]);
  }
  void fetchProducts() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://48977225-62ee-4426-aca1-e7c25da0e47b.mock.pstmn.io/products'));
      if (response.statusCode == 200) {
        List data = json.decode(response.body);
        products.assignAll(data.map((json) => Product.fromJson(json)).toList());
      } else {
        Get.snackbar('Error', 'Failed to load products');
      }
    } catch (e) {
        print("Network error: $e");
      Get.snackbar('Error', 'Network or Server Error');
    } finally {
      isLoading(false);
    }
  }
}
