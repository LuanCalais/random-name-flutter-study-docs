import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/app_state.dart';
import '../widgets/big_card.dart';
import '../widgets/action_buttons.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final pair = appState.current;
    final isFav = appState.isFavorite(pair);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          const SizedBox(height: 12),
          ActionButtons(
            isFavorite: isFav,
            onToggleFavorite: appState.toggleFavorite,
            onNext: appState.getNext,
          ),
        ],
      ),
    );
  }
}
