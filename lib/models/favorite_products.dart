import 'package:flutter/foundation.dart';

class FavoriteProducts with ChangeNotifier {
  final List<String> _favorites = [];

  List<String> get favorites => _favorites;

  
  void toggleFavorite(String product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product); 
    } else {
      _favorites.add(product); 
    }
    notifyListeners(); 
  }

  
  bool isFavorite(String product) {
    return _favorites.contains(product);
  }
}
