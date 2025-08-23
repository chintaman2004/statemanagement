import 'package:flutter/material.dart';
import '/models/property_model.dart';
import '/widgets/property_card.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Property> properties = [
    Property(
      id: '1',
      title: 'Luxury Apartment',
      description: 'A beautiful luxury apartment in the city center.',
      price: 250000,
      imageUrl: 'https://picsum.photos/400/200',
      location: 'Karachi',
    ),
    Property(
      id: '2',
      title: 'Beach House',
      description: 'Enjoy the sea breeze in this stunning beach house.',
      price: 500000,
      imageUrl: 'https://picsum.photos/400/201',
      location: 'Clifton, Karachi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          return PropertyCard(property: properties[index]);
        },
      ),
    );
  }
}
