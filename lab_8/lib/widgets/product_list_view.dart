import 'package:flutter/material.dart';

import '../models/product.dart';
import 'delete_background.dart';
import 'product_list_item.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  final void Function(Product product) onRemove;

  const ProductListView({
    super.key,
    required this.products,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) =>
          const Divider(height: 1, indent: 16, endIndent: 16),
      itemBuilder: (context, index) {
        final product = products[index];
        return Dismissible(
          key: ValueKey(product.id),
          direction: DismissDirection.endToStart,
          background: const DeleteBackground(),
          onDismissed: (direction) => onRemove(product),
          child: ProductListItem(product: product),
        );
      },
    );
  }
}
