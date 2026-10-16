import 'package:flutter/material.dart';
import '../models/product.dart';
import 'favorites_tab.dart';
import 'feed_tab.dart';
import 'profile_tab.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;
  bool _notifications = true;
  final List<Product> _products = createProducts();

  Future<void> _openDetail(Product product) async {
    await Navigator.pushNamed(context, '/details', arguments: product);
    if (!mounted) return;
    setState(() {});
  }

  void _toggleFavorite(Product product) {
    setState(() {
      product.isFavorite = !product.isFavorite;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          product.isFavorite
              ? 'Добавлено в избранное'
              : 'Удалено из избранного',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> favorites =
        _products.where((p) => p.isFavorite).toList();

    final List<Widget> pages = [
      FeedTab(
        products: _products,
        onItemTap: _openDetail,
        onFavoriteTap: _toggleFavorite,
      ),
      FavoritesTab(
        favorites: favorites,
        onItemTap: _openDetail,
      ),
      ProfileTab(
        favoritesCount: favorites.length,
        notifications: _notifications,
        onNotificationsChanged: (v) => setState(() => _notifications = v),
      ),
    ];

    final List<String> titles = ['Лента', 'Избранное', 'Профиль'];

    return Scaffold(
      appBar: AppBar(title: Text(titles[_currentIndex])),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Лента'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}