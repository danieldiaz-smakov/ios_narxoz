import 'package:flutter/material.dart';

class EmptyCatalog extends StatelessWidget {
  final VoidCallback onReset;

  const EmptyCatalog({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inventory_2_outlined, size: 96, color: scheme.outline),
          const SizedBox(height: 16),
          const Text(
            'Catalog is Empty',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'All items were removed.',
            style: TextStyle(color: scheme.outline),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.restore),
            label: const Text('Reset Catalog'),
          ),
        ],
      ),
    );
  }
}
