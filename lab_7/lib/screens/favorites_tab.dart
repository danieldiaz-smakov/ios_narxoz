import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoritesTab extends StatelessWidget {
  final List<Product> favorites;
  final void Function(Product) onItemTap;

  const FavoritesTab({
    super.key,
    required this.favorites,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return const Center(
        child: Text(
          'Пока нет сохранённых товаров.\nНажмите ♥ в ленте или на экране товара.',
          textAlign: TextAlign.center,
        ),
      );
    }

    final double total = favorites.fold(0.0, (sum, p) => sum + p.price);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: favorites.map((product) {
              return ListTile(
                leading: Image.network(
                  product.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(product.title),
                subtitle: Text(product.category),
                trailing: Text('${product.price.toStringAsFixed(0)} ₸'),
                onTap: () => onItemTap(product),
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const Text('Итого:', style: TextStyle(fontSize: 16)),
              const Spacer(),
              Text(
                '${total.toStringAsFixed(0)} ₸',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}