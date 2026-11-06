import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final Color color;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
  });

  String get priceText => '${price.round()} ₸';
}

const List<Product> products = [
  Product(id: 1, name: 'Смартфон', price: 189990, color: Colors.indigo),
  Product(id: 2, name: 'Ноутбук', price: 449990, color: Colors.teal),
  Product(id: 3, name: 'Наушники', price: 34990, color: Colors.orange),
  Product(id: 4, name: 'Часы', price: 79990, color: Colors.pink),
  Product(id: 5, name: 'Клавиатура', price: 24990, color: Colors.green),
  Product(id: 6, name: 'Фотоаппарат', price: 299990, color: Colors.deepPurple),
];

class CartProvider extends ChangeNotifier {
  List<Product> _items = [];
  List<Product> get items => List.unmodifiable(_items);

  int get count => _items.length;

  double get totalPrice => _items.fold(0.0, (sum, p) => sum + p.price);

  bool isInCart(Product product) =>
      _items.where((p) => p.id == product.id).length > 0;

  void add(Product product) {
    if (isInCart(product)) return;
    _items.add(product);
    notifyListeners();
  }

  void remove(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void toggle(Product product) {
    if (isInCart(product)) {
      remove(product);
    } else {
      add(product);
    }
  }

  Product removeAt(int index) {
    final deleted = _items.removeAt(index);
    notifyListeners();
    return deleted;
  }

  void insertAt(int index, Product product) {
    if (isInCart(product)) return;
    int position = index;
    if (position > _items.length) position = _items.length;
    _items.insert(position, product);
    notifyListeners();
  }

  void clear() {
    _items = [];
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

final _router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const CatalogScreen()),
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Global Cart',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      routerConfig: _router,
    );
  }
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Каталог'),
        actions: const [CartBadge()],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.78,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

class CartBadge extends StatelessWidget {
  const CartBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return TextButton(
          onPressed: () => context.push('/cart'),
          child: SizedBox(
            width: 40,
            height: 36,
            child: Stack(
              children: [
                const Positioned(
                  left: 0,
                  bottom: 0,
                  child: Icon(Icons.shopping_cart, size: 28),
                ),
                cart.count > 0
                    ? Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            '${cart.count}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final inCart = context.watch<CartProvider>().isInCart(product);

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: product.color,
              child: Center(
                child: const Icon(
                  Icons.shopping_bag,
                  size: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(product.name, style: const TextStyle(fontSize: 16)),
          Text(product.priceText, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.read<CartProvider>().toggle(product),
                  child: Text(inCart ? 'Убрать' : 'В корзину'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _remove(BuildContext context, int index) {
    final cart = context.read<CartProvider>();
    final deleted = cart.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${deleted.name} удалён'),
        duration: const Duration(seconds: 3),
        persist: false,
        action: SnackBarAction(
          label: 'ОТМЕНА',
          onPressed: () => cart.insertAt(index, deleted),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(title: Text('Корзина (${cart.count})')),
      body: cart.count == 0
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_cart, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('Корзина пуста', style: TextStyle(fontSize: 24)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.canPop() ? context.pop() : context.go('/'),
                    child: const Text('В каталог'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final product = items[index];
                      return Dismissible(
                        key: ValueKey(product.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) => _remove(context, index),
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.shopping_bag),
                          ),
                          title: Text(product.name),
                          subtitle: Text(product.priceText),
                          trailing: TextButton(
                            onPressed: () => _remove(context, index),
                            child: const Text('Удалить'),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: 16 + MediaQuery.of(context).padding.bottom,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text('Итого:', style: TextStyle(fontSize: 20)),
                          const Spacer(),
                          Text(
                            '${cart.totalPrice.round()} ₸',
                            style: const TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  context.read<CartProvider>().clear(),
                              child: const Text('Очистить всё'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
