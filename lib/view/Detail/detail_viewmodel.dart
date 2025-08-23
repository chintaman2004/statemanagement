import 'package:flutter/foundation.dart';
import 'package:real_estate_app/models/item_model.dart';

class DetailsViewModel extends ChangeNotifier {
  void buyNow(ItemModel item) {
    debugPrint("Buying: ${item.title} at \$${item.price}");
  }
}
