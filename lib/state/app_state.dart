import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';

class MyAppState extends ChangeNotifier {
  WordPair _current = WordPair.random();
  final List<WordPair> _favorites = <WordPair>[];

  WordPair get current => _current;
  List<WordPair> get favorites => List.unmodifiable(_favorites);

  void getNext() {
    _current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (_favorites.contains(_current)) {
      _favorites.remove(_current);
    } else {
      _favorites.add(_current);
    }
    notifyListeners();
  }

  void removeFavorite(WordPair pair) {
    _favorites.remove(pair);
    notifyListeners();
  }

  bool isFavorite(WordPair pair) => _favorites.contains(pair);
}
