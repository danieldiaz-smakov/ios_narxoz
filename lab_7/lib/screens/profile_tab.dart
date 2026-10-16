import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final int favoritesCount;
  final bool notifications;
  final void Function(bool) onNotificationsChanged;

  const ProfileTab({
    super.key,
    required this.favoritesCount,
    required this.notifications,
    required this.onNotificationsChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 48,
            child: Icon(Icons.person, size: 48),
          ),
          const SizedBox(height: 16),
          const Text(
            'Daniel',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text('daniel.smakov@narxoz.kz'),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(Icons.favorite, color: Colors.red),
              title: const Text('Товаров в избранном'),
              trailing: Text(
                '$favoritesCount',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Card(
            child: SwitchListTile(
              title: const Text('Уведомления'),
              value: notifications,
              onChanged: onNotificationsChanged,
            ),
          ),
        ],
      ),
    );
  }
}