import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ProductScreen()));
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  void _addToCart() {}

  Widget _badge(String text) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          const SizedBox(height: 6),
          Text('  $text  '),
          const SizedBox(height: 6),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double coverHeight = screenHeight * 0.3;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: coverHeight,
                    child: Stack(
                      children: [

                        Container(
                          width: screenWidth,
                          height: coverHeight,
                          color: Colors.indigo,
                        ),

                        Positioned(
                          left: screenWidth / 2 - 48,
                          top: coverHeight / 2 - 48,
                          child: const Icon(
                            Icons.headphones,
                            size: 96,
                            color: Colors.white,
                          ),
                        ),

                        Positioned(
                          top: MediaQuery.of(context).padding.top + 16,
                          right: 16,
                          child: Container(
                            color: Colors.white,
                            child: const Icon(
                              Icons.bookmark,
                              size: 32,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Wireless Noise-Cancelling Headphones Pro Max',
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text('129.99 USD'),
                              ],
                            ),
                            const SizedBox(height: 12),

                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber),
                                const Icon(Icons.star, color: Colors.amber),
                                const Icon(Icons.star, color: Colors.amber),
                                const Icon(Icons.star, color: Colors.amber),
                                const Icon(Icons.star_half, color: Colors.amber),
                                const SizedBox(width: 8),
                                const Expanded(
                                  child: Text('4.5 (128 reviews)'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            Row(
                              children: [
                                Expanded(
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _badge('Electronics'),
                                      _badge('Audio'),
                                      _badge('Headphones'),
                                      _badge('Wireless'),
                                      _badge('Bestseller'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),

                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Premium over-ear headphones with active noise '
                                    'cancellation, 40 hours of battery life and '
                                    'fast charging. Soft ear cushions make them '
                                    'comfortable for long listening sessions. '
                                    'Supports Bluetooth 5.3 and a wired connection.',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _addToCart,
                        child: const Text('Add to Cart'),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                SizedBox(height: 16 + MediaQuery.of(context).padding.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }
}