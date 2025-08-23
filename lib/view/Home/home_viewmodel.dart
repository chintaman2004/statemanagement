import 'package:flutter/foundation.dart';
import '/models/property_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Property> _properties = [];

  List<Property> get properties => _properties;

  void setProperties(List<Property> properties) {
    _properties = properties;
    notifyListeners();
  }

  void addProperty(Property property) {
    _properties.add(property);
    notifyListeners();
  }

  void removeProperty(String id) {
    _properties.removeWhere((property) => property.id == id);
    notifyListeners();
  }
}
