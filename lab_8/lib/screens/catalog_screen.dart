import 'package:flutter/material.dart';

import '../models/product.dart';
import '../models/product_seed.dart';
import '../widgets/empty_catalog.dart';
import '../widgets/product_grid_view.dart';
import '../widgets/product_list_view.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  late List<Product> _products;
  late int _nextId;
  bool _isGrid = false;

  @override
  void initState() {
    super.initState();
    _loadSeedData();
  }

  void _loadSeedData() {
    _products = ProductSeed.initialProducts();
    _nextId = ProductSeed.initialCount + 1;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    if (!mounted) return;

    setState(() {
      _products.insert(0, ProductSeed.freshProduct(_nextId));
      _nextId++;
    });
  }

  void _removeProduct(Product product) {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index == -1) return;

    setState(() => _products.removeAt(index));

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text('${product.title} deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () => _restoreProduct(index, product),
        ),
      ),
    );
  }

  void _restoreProduct(int index, Product product) {
    setState(() {
      final safeIndex = index > _products.length ? _products.length : index;
      _products.insert(safeIndex, product);
    });
  }

  void _resetCatalog() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(_loadSeedData);
  }

  Widget _buildBody() {
    if (_products.isEmpty) {
      return EmptyCatalog(onReset: _resetCatalog);
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: _isGrid
          ? ProductGridView(products: _products, onRemove: _removeProduct)
          : ProductListView(products: _products, onRemove: _removeProduct),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Catalog (${_products.length})'),
        actions: [
          IconButton(
            tooltip: _isGrid ? 'Show list' : 'Show grid',
            icon: Icon(_isGrid ? Icons.view_list : Icons.grid_view),
            onPressed: () => setState(() => _isGrid = !_isGrid),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}
