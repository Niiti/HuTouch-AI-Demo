// lib/features/coffee_shop/presentation/widgets/product_grid_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../coffee_shop/domain/blocs/coffee_bloc.dart';
import 'product_card_widget.dart';

class ProductGridWidget extends StatelessWidget {
  const ProductGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state is CoffeeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CoffeeLoaded) {
          final products = state.products;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3 / 4,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCardWidget(
                  imageUrl: product.imageUrl,
                  rating: product.rating,
                  title: product.title,
                  subtitle: product.subtitle,
                  price: product.price,
                );
              },
            ),
          );
        } else if (state is CoffeeError) {
          return Center(child: Text(state.message));
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
