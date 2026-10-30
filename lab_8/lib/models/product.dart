import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String category;
  final double rating;
  final double price;
  final IconData icon;

  const Product({
    required this.id,
    required this.title,
    required this.category,
    required this.rating,
    required this.price,
    required this.icon,
  });

  String get priceLabel => '${price.toStringAsFixed(0)} ₸';

  String get ratingLabel => rating.toStringAsFixed(1);
}
