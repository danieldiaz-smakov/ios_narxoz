import 'package:flutter/material.dart';

class DeleteBackground extends StatelessWidget {
  final BorderRadius borderRadius;

  const DeleteBackground({super.key, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(color: Colors.red, borderRadius: borderRadius),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}
