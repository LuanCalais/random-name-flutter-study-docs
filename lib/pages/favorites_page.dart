import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<MyAppState>().favorites;

    if (favorites.isEmpty) {
      return const Center(child: Text('No favorites yet.'));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemCount: favorites.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final WordPair pair = favorites[index];
        return ListTile(
          title: Text(pair.asSnakeCase),
          trailing: IconButton(
            tooltip: 'Remove',
            icon: const Icon(Icons.delete_outline),
            onPressed: () => context.read<MyAppState>().removeFavorite(pair),
          ),
        );
      },
    );
  }
}
