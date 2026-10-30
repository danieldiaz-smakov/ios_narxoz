import 'package:flutter/material.dart';

import 'product.dart';

class ProductSeed {
  static const int initialCount = 30;

  static const List<Product> _templates = [
    Product(id: 0, title: 'Wireless Headphones', category: 'Audio', rating: 4.7, price: 24990, icon: Icons.headphones),
    Product(id: 0, title: 'Smart Watch', category: 'Wearables', rating: 4.5, price: 39990, icon: Icons.watch),
    Product(id: 0, title: 'Mechanical Keyboard', category: 'Accessories', rating: 4.6, price: 18990, icon: Icons.keyboard),
    Product(id: 0, title: 'Gaming Mouse', category: 'Accessories', rating: 4.4, price: 9990, icon: Icons.mouse),
    Product(id: 0, title: '4K Monitor', category: 'Displays', rating: 4.8, price: 129990, icon: Icons.desktop_windows),
    Product(id: 0, title: 'Laptop Stand', category: 'Accessories', rating: 4.2, price: 6990, icon: Icons.laptop),
    Product(id: 0, title: 'Smartphone', category: 'Phones', rating: 4.9, price: 249990, icon: Icons.smartphone),
    Product(id: 0, title: 'Tablet', category: 'Tablets', rating: 4.5, price: 159990, icon: Icons.tablet_mac),
    Product(id: 0, title: 'Bluetooth Speaker', category: 'Audio', rating: 4.3, price: 14990, icon: Icons.speaker),
    Product(id: 0, title: 'Camera', category: 'Photo', rating: 4.6, price: 189990, icon: Icons.photo_camera),
    Product(id: 0, title: 'Power Bank', category: 'Accessories', rating: 4.1, price: 7990, icon: Icons.battery_charging_full),
    Product(id: 0, title: 'Printer', category: 'Office', rating: 4.0, price: 54990, icon: Icons.print),
  ];

  static List<Product> initialProducts() {
    return List.generate(initialCount, (i) => _build(i + 1));
  }

  static Product freshProduct(int id) => _build(id, titlePrefix: 'NEW: ');

  static Product _build(int id, {String titlePrefix = ''}) {
    final template = _templates[(id - 1) % _templates.length];
    final generation = (id - 1) ~/ _templates.length + 1;
    return Product(
      id: id,
      title: '$titlePrefix${template.title} Gen $generation',
      category: template.category,
      rating: template.rating,
      price: template.price,
      icon: template.icon,
    );
  }
}
