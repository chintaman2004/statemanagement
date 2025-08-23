import 'package:flutter/foundation.dart';
import '../../models/item_model.dart';

class WishlistViewModel extends ChangeNotifier {
  final List<ItemModel> _favorites = [];

  List<ItemModel> get favorites => _favorites;

  void toggleFavorite(ItemModel item) {
    if (isFavorite(item)) {
      _favorites.removeWhere((i) => i.id == item.id);
    } else {
      _favorites.add(item);
    }
    notifyListeners();
  }

  bool isFavorite(ItemModel item) {
    return _favorites.any((i) => i.id == item.id);
  }

  void removeFavorite(ItemModel item) {
    _favorites.removeWhere((i) => i.id == item.id);
    notifyListeners();
  }
}
