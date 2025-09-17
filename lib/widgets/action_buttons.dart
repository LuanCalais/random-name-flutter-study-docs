import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onNext,
  });

  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: onToggleFavorite,
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          label: const Text('Like'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: onNext,
          child: const Text('Randomize'),
        ),
      ],
    );
  }
}
