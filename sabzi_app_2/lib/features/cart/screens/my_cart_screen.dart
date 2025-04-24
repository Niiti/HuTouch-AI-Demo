import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/core/constants/color_palette.dart';
import 'package:my_project/core/localization/app_localizations.dart';
import 'package:my_project/features/cart/bloc/cart_cubit.dart';
import 'package:my_project/features/cart/widgets/header_widget.dart';
import 'package:my_project/features/cart/widgets/cart_item.dart';
import 'package:my_project/features/cart/widgets/checkout_section_widget.dart';
import 'package:my_project/features/cart/widgets/bottom_nav_bar_widget.dart';
import 'package:my_project/features/home/widgets/bottom_navigation_bar_widget.dart';
import 'package:dio/dio.dart';
import 'package:my_project/features/cart/models/cart_item.dart' as cart_model;

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  Future<List<cart_model.CartItem>> fetchCartItems() async {
    final dio = Dio();
    final response = await dio.get(
      'https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io/get_cart_list',
    );

    if (response.statusCode == 200) {
      return (response.data as List).map((item) {
        return cart_model.CartItem(
          imagePath: item['image_url'] ?? '',
          title: item['name'] ?? '',
          subtitle: '[0m${item['unit'] ?? ''}, Price',
          price: item['price'] != null ? item['price'].toDouble() : 0.0,
          quantity: item['quantity'] ?? 1,
        );
      }).toList();
    } else {
      throw Exception('Failed to load cart items');
    }
  }

  double calculateTotalPrice(List cartItems) {
    return cartItems.fold(
      0,
      (total, current) => total + current.price * current.quantity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return BlocProvider(
      create:
          (_) =>
              CartCubit()..loadCartItems(
                fetchItems: fetchCartItems,
              ), // Call loadCartItems with fetchCartItems
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is CartError) {
            return Scaffold(body: Center(child: Text(state.message)));
          } else if (state is CartLoaded) {
            final totalPrice = calculateTotalPrice(state.cartItems);
            return Scaffold(
              backgroundColor: ColorPalette.background,
              appBar: AppBar(
                backgroundColor: ColorPalette.background,
                elevation: 0,
                toolbarHeight: 0,
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    const HeaderWidget(),
                    const Divider(color: ColorPalette.divider),
                    Expanded(
                      child: Scrollbar(
                        child: ListView.separated(
                          itemCount: state.cartItems.length,
                          separatorBuilder:
                              (context, index) =>
                                  const Divider(color: ColorPalette.divider),
                          itemBuilder: (context, index) {
                            return CartItem(
                              cartItem: state.cartItems[index],
                              onQuantityChanged:
                                  (change) => context
                                      .read<CartCubit>()
                                      .updateQuantity(index, change),
                              onRemove:
                                  () => context.read<CartCubit>().removeItem(
                                    index,
                                  ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: CheckoutSectionWidget(totalPrice: totalPrice),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              bottomNavigationBar: const BottomNavigationBarWidget(),
            );
          } else {
            return Container(); // Default empty state
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
