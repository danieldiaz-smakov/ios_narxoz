import 'package:flutter/material.dart';

import '../models/product.dart';
import 'delete_background.dart';
import 'product_grid_card.dart';

class ProductGridView extends StatelessWidget {
  final List<Product> products;
  final void Function(Product product) onRemove;

  const ProductGridView({
    super.key,
    required this.products,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Dismissible(
          key: ValueKey(product.id),
          direction: DismissDirection.endToStart,
          background: const DeleteBackground(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          onDismissed: (direction) => onRemove(product),
          child: ProductGridCard(product: product),
        );
      },
    );
  }
}
