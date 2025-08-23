import '../models/property_model.dart';

class PropertyRepository {
  final List<Property> _properties = [
    Property(
      id: "1",
      title: "Luxury Apartment in Karachi",
      price: 12000000,
      location: "Clifton, Karachi",
      imageUrl: "https://via.placeholder.com/300x200.png?text=Apartment+1",
      description:
          "A beautiful sea-facing luxury apartment in the heart of Clifton.",
    ),
    Property(
      id: "2",
      title: "Modern Villa in Lahore",
      price: 35000000,
      location: "DHA Phase 5, Lahore",
      imageUrl: "https://via.placeholder.com/300x200.png?text=Villa+2",
      description: "Spacious modern villa with swimming pool and garden.",
    ),
    Property(
      id: "3",
      title: "Affordable Flat in Islamabad",
      price: 7500000,
      location: "G-11, Islamabad",
      imageUrl: "https://via.placeholder.com/300x200.png?text=Flat+3",
      description: "Affordable 2-bedroom flat in a prime location.",
    ),
  ];

  List<Property> getAllProperties() {
    return _properties;
  }

  Property? getPropertyById(String id) {
    try {
      return _properties.firstWhere((property) => property.id == id);
    } catch (e) {
      return null;
    }
  }

  void addProperty(Property property) {
    _properties.add(property);
  }

  void deleteProperty(String id) {
    _properties.removeWhere((property) => property.id == id);
  }
}
