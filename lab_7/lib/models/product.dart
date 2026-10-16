class Product {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final double price;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    this.isFavorite = false,
  });
}

List<Product> createProducts() {
  return [
    Product(
      id: 1,
      title: 'Беспроводные наушники',
      description:
          'Наушники с шумоподавлением и временем работы до 30 часов. '
          'Быстрая зарядка: 10 минут дают 5 часов прослушивания.',
      imageUrl: 'https://picsum.photos/id/1/600/400',
      category: 'Электроника',
      price: 45000,
    ),
    Product(
      id: 2,
      title: 'Спортивные кроссовки',
      description:
          'Лёгкие кроссовки для бега и тренировок. '
          'Дышащий материал и амортизирующая подошва.',
      imageUrl: 'https://picsum.photos/id/21/600/400',
      category: 'Одежда',
      price: 38500,
    ),
    Product(
      id: 3,
      title: 'Умные часы',
      description:
          'Пульсометр, GPS, уведомления и защита от воды. '
          'Работают до 7 дней без подзарядки.',
      imageUrl: 'https://picsum.photos/id/60/600/400',
      category: 'Гаджеты',
      price: 72000,
    ),
    Product(
      id: 4,
      title: 'Рюкзак для ноутбука',
      description:
          'Вместительный рюкзак с отделением под ноутбук 15". '
          'Водоотталкивающая ткань и USB-порт для зарядки.',
      imageUrl: 'https://picsum.photos/id/96/600/400',
      category: 'Аксессуары',
      price: 21900,
    ),
  ];
}